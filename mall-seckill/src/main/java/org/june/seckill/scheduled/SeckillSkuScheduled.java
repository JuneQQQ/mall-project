package org.june.seckill.scheduled;

import lombok.extern.slf4j.Slf4j;
import org.june.seckill.service.SeckillService;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * 秒杀商品的定时上架：每天凌晨3点
 * 上架最近三天需要秒杀的商品
 */
@Slf4j
@Service
public class SeckillSkuScheduled {
    private final String upload_lock = "seckill:upload_lock";
    @Autowired
    SeckillService seckillService;
    @Autowired
    RedissonClient redissonClient;

    /**
     * 找出start_time在今天0:00到三天后0:00区间内的session（秒杀场次）
     * 并将上架秒杀商品信息和库存数放入redis
     * 此方法采用redisson分布式锁，固定加锁时间为20s
     */
    @Async
    //                 秒 分 时 日 月 周 年
    @Scheduled(cron = "0 0 3 * * ?")  // 每天3:00AM上架秒杀商品
//    @Scheduled(cron = "0 0 0/1 * * ? ")  //  每小时 prod
    public void uploadSeckillSkuLatest3Days() {
        log.info("上架秒杀！");
        RLock lock = redissonClient.getLock(upload_lock);
        lock.lock(20, TimeUnit.SECONDS);
        try {
            seckillService.uploadSeckillSkuLatest3Days();
        } finally {
            lock.unlock();
        }
    }
}
