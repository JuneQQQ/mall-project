package org.june.seckill.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import feign.FeignException;
import lombok.extern.slf4j.Slf4j;
import org.june.common.constant.SeckillConstant;
import org.june.common.to.QuickOrderTo;
import org.june.common.utils.R;
import org.june.seckill.feign.CouponFeignService;
import org.june.seckill.feign.ProductFeignService;
import org.june.seckill.interceptor.LoginUserInterceptor;
import org.june.seckill.service.SeckillService;
import org.june.seckill.to.SeckillSkuRedisTo;
import org.june.seckill.vo.SeckillSessionWithSkus;
import org.june.seckill.vo.SkuInfoVo;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@Slf4j
public class SeckillServiceImpl implements SeckillService {
    @Autowired
    CouponFeignService couponFeignService;
    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    ProductFeignService productFeignService;
    @Autowired
    RedissonClient redissonClient;
    @Autowired
    RabbitTemplate rabbitTemplate;


    /**
     * 扫描需要参与秒杀的活动，并缓存商品信息
     */
    @Override
    public void uploadSeckillSkuLatest3Days() {
        R r = couponFeignService.getLatestNDaySession(3);
        if (r.getCode() == 0) {
            // 上架秒杀商品（redis）
            List<SeckillSessionWithSkus> data = r.getData(new TypeReference<List<SeckillSessionWithSkus>>() {
            });
            saveSessionInfos(data);
        }
    }

    /**
     * 该方法缓存商品信息
     * 有两个要点：随机码、信号量（库存数）
     * 随机码是用于商品加密，只有在秒杀时间段才会返回给前台，该值作为库存的key
     * 使用redisson将库存数作为信号量
     *
     * 三个redis数据结构
     * list seckill:sessions:1658620800000-1658628000000-4
     * hash seckill:skus   (key)59-4  (value)SeckillSkuRedisTo
     * string (key)stock:randCode (value)stockNum
     */
    private void saveSessionInfos(List<SeckillSessionWithSkus> data) {
        if (CollectionUtils.isNotEmpty(data)) {
            BoundHashOperations<String, String, String> hashOps = redisTemplate.boundHashOps(SeckillConstant.SECKILL_SKUS_PREFIX);
            data.forEach(session -> {
                // 秒杀场次信息缓存，采用list数据结构存储
                long start = session.getStartTime().getTime();
                long end = session.getEndTime().getTime();
                // 开始时间-结束时间-秒杀场次id
                String redisKey = SeckillConstant.SECKILL_SESSION_PREFIX + start + "-" + end + "-" + session.getId();
                if (Boolean.FALSE.equals(redisTemplate.hasKey(redisKey))) {
                    // 没有上架过这个商品才会到这，【所以同一个商品只能加入到一个秒杀场次中】
                    List<String> ids = session.getRelationSkus().stream().map(i ->
                            i.getSkuId().toString()).collect(Collectors.toList());
                    redisTemplate.opsForList().leftPushAll(redisKey, ids);
                }

                // 每一场秒杀商品缓存如下
                session.getRelationSkus().forEach(item -> {
                    // 使用 sessionId-skuId 为SeckillConstant.SECKILL_SKUS_PREFIX Hash下的键，值为商品信息
                    String skuKey = item.getSkuId().toString() + "-" + session.getId();
                    if (Boolean.FALSE.equals(hashOps.hasKey(skuKey))) {
                        SeckillSkuRedisTo to = new SeckillSkuRedisTo();
                        // 1.SKUs基本信息
                        R r = productFeignService.skuInfo(item.getSkuId());
                        if (r.getCode() == 0) {
                            SkuInfoVo skuInfo = r.getData("skuInfo", new TypeReference<SkuInfoVo>() {
                            });
                            to.setSkuInfoVo(skuInfo);
                        }
                        // 2.SKUs秒杀信息，当场商品秒杀信息是一样的
                        BeanUtils.copyProperties(item, to);
                        to.setSeckillLimit(item.getSeckillLimit());
                        // 3.设置当前商品的秒杀时间信息
                        to.setStartTime(session.getStartTime().getTime());
                        to.setEndTime(session.getEndTime().getTime());
                        // 4.随机码
                        String token = UUID.randomUUID().toString().replace("-", "");
                        to.setRandomCode(token);
                        hashOps.put(skuKey, JSON.toJSONString(to));
                        // 5.引入redisson分布式信号量作为库存——起限流作用
                        RSemaphore semaphore = redissonClient.getSemaphore(SeckillConstant.SECKILL_SKU_STOCK_PREFIX + token);
                        // 商品可以秒杀的数量作为信号量
                        semaphore.trySetPermits(item.getSeckillCount());
                    }
                });
            });
        }
    }


//    public List<SeckillSkuRedisTo> blockHandler(BlockException e) {
//        log.error("getCurrentSeckillSkus 被限流！");
//        return null;
//    }

    public List<SeckillSkuRedisTo> fallbackHandler() {
        log.error("异常发生！");
        return null;
    }

    /**
     * blockHandler 针对原方法被限流/降级/系统保护的时候调用
     * fallback 函数针对所有类型的异常调用
     *
     * @return
     */
    @Override
//    @SentinelResource(value = "seckillSkus", fallback = "fallbackHandler", blockHandler = "blockHandler")
    public List<SeckillSkuRedisTo> getCurrentSeckillSkus() {
        // 1.确定当前时间有哪些秒杀场次
        Set<String> keys = redisTemplate.keys(SeckillConstant.SECKILL_SESSION_PREFIX + "*");
        if (CollectionUtils.isNotEmpty(keys)) {
            // 该时间段的所有秒杀
//            ArrayList<List<SeckillSkuRedisTo>> lists = new ArrayList<>();
            for (String key : keys) {
                String replace = key.replace(SeckillConstant.SECKILL_SESSION_PREFIX, "");
                String[] split = replace.split("-");
                // 0-startTime 1-endTime 2-sessionId
                long now = new Date().getTime();
                long start = Long.parseLong(split[0]);
                long end = Long.parseLong(split[1]);
                long sessionId = Long.parseLong(split[2]);
                if (now >= start && now <= end) {
                    // 锁定这个场次的商品sku ids
                    List<String> skuIds = redisTemplate.opsForList().range(key, 0, -1);
                    if (CollectionUtils.isNotEmpty(skuIds)) {
                        BoundHashOperations<String, String, String> hashOps =
                                redisTemplate.boundHashOps(SeckillConstant.SECKILL_SKUS_PREFIX);
                        // hash结构的 keys
                        List<String> hashKeys = skuIds.stream().map(i -> i + "-" + sessionId).collect(Collectors.toList());
                        // hash结构的values
                        List<String> objects = hashOps.multiGet(hashKeys);
                        if (CollectionUtils.isNotEmpty(hashKeys)) {
                            List<SeckillSkuRedisTo> collect = objects.stream().map(item ->
                                    JSON.parseObject(item, SeckillSkuRedisTo.class)).collect(Collectors.toList());
                            return collect;
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * 由商品详情页调用，查询商品的秒杀信息
     */
    @Override
    public SeckillSkuRedisTo getSkuSeckillInfo(Long skuId) {
        BoundHashOperations<String, String, String> hashOps =
                redisTemplate.boundHashOps(SeckillConstant.SECKILL_SKUS_PREFIX);
        Set<String> keys = hashOps.keys();
        if (CollectionUtils.isNotEmpty(keys)) {
            String reg = skuId + "-\\d";  // '31-\d'
            for (String key : keys) {
                if (Pattern.matches(reg, key)) {
                    String json = hashOps.get(key);
                    SeckillSkuRedisTo seckillSkuRedisTo = JSON.parseObject(json, SeckillSkuRedisTo.class);
                    // 随机码，这个设计好像是冗余的？！
//                    long current = new Date().getTime();
//                    if (!(current >= seckillSkuRedisTo.getStartTime() && current <= seckillSkuRedisTo.getEndTime())) {
//                        // 没有到秒杀时间随机码不能返回给前台
//                        seckillSkuRedisTo.setRandomCode(null);
//                    }
                    return seckillSkuRedisTo;
                }
            }

        }
        return null;
    }

    /**
     * 秒杀逻辑
     */
    @Override
    public String kill(String killId, String randomCode, Integer num) {
        BoundHashOperations<String, String, String> hashOps = redisTemplate.boundHashOps(SeckillConstant.SECKILL_SKUS_PREFIX);
        String s = hashOps.get(killId); // killId:31-2
        if (StringUtils.isNotEmpty(s)) {
            // 校验参数 >>>
            SeckillSkuRedisTo redisTo = JSON.parseObject(s, SeckillSkuRedisTo.class);
            Long startTime = redisTo.getStartTime();
            Long endTime = redisTo.getEndTime();
            long now = new Date().getTime();
            // 1.校验时间
            if (now >= startTime && now <= endTime) {
                // 2.校验随机码和商品ID
                String redisToRandomCode = redisTo.getRandomCode();
                String redisKey = redisTo.getSkuId() + "-" + redisTo.getPromotionSessionId();
                if (redisToRandomCode.equals(randomCode) && killId.equals(redisKey)) {
                    // 3.校验购物数量
                    if (num <= redisTo.getSeckillLimit()) {
                        // 4.校验是否购买过，占位：prefix-userId-skuId-sessionId
                        Long userID = LoginUserInterceptor.loginUser.get();
                        String redisUserKey = SeckillConstant.SECKILL_USER_MARK_PREFIX + redisToRandomCode +
                                userID + "-" + redisTo.getSkuId() + "-" + redisTo.getPromotionSessionId();
                        Boolean mark = redisTemplate.opsForValue().setIfAbsent(redisUserKey, String.valueOf(num),
                                Duration.ofMillis(endTime - now));
                        if (Boolean.TRUE.equals(mark)) {
                            // 占位成功，未购买过
                            RSemaphore semaphore = redissonClient.getSemaphore(SeckillConstant.SECKILL_SKU_STOCK_PREFIX + randomCode);
//                            semaphore.acquire(num); // 该方法阻塞
                            try {
                                if (semaphore.tryAcquire(num, 500, TimeUnit.MILLISECONDS)) {
                                    // 秒杀成功
                                    String timeId = IdWorker.getTimeId();
                                    // 对象构造
                                    QuickOrderTo quickOrderTo = new QuickOrderTo();
                                    quickOrderTo.setOrderSn(timeId);
                                    quickOrderTo.setNum(num);
                                    quickOrderTo.setMemberId(userID);
                                    quickOrderTo.setPromotionSessionId(redisTo.getPromotionSessionId());
                                    quickOrderTo.setSkuId(redisTo.getSkuId());
                                    quickOrderTo.setSeckillPrice(redisTo.getSeckillPrice());
                                    // 秒杀成功，发送mq订单消息，并返回订单号通知前台秒杀成功
                                    rabbitTemplate.convertAndSend("order-event-exchange",
                                            "order.seckill.order", quickOrderTo);
                                    return timeId;
                                }
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                                return null;
                            }
                        }
                    }
                }
            }
        }
        return null;
    }
}
