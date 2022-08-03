package org.june.order.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.constant.OrderStatusEnum;
import org.june.common.to.OrderTo;
import org.june.common.to.QuickOrderTo;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.common.utils.R;
import org.june.order.constant.OrderConstant;
import org.june.order.dao.OrderDao;
import org.june.order.entity.OrderEntity;
import org.june.order.entity.OrderItemEntity;
import org.june.order.entity.PaymentInfoEntity;
import org.june.order.feign.CartFeignService;
import org.june.order.feign.MemberFeignService;
import org.june.order.feign.ProductFeignService;
import org.june.order.feign.WareFeignService;
import org.june.order.interceptor.LoginUserInterceptor;
import org.june.order.service.OrderItemService;
import org.june.order.service.OrderService;
import org.june.order.service.PaymentInfoService;
import org.june.order.to.OrderCreateTo;
import org.june.order.vo.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;


@Service("orderService")
public class OrderServiceImpl extends ServiceImpl<OrderDao, OrderEntity> implements OrderService {
    public static ThreadLocal<OrderSubmitVo> orderSubmitVoThreadLocal = new ThreadLocal<>();
    @Autowired
    MemberFeignService memberFeignService;
    @Autowired
    CartFeignService cartFeignService;
    @Autowired
    ThreadPoolExecutor executor;
    @Autowired
    WareFeignService wareFeignService;
    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    ProductFeignService productFeignService;
    @Autowired
    OrderDao orderDao;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    PaymentInfoService paymentInfoService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderEntity> page = this.page(
                new Query<OrderEntity>().getPage(params),
                new QueryWrapper<OrderEntity>()
        );

        return new PageUtils(page);
    }

    /**
     * 封装订单确认页所需要的参数 OrderConfirmVo
     */
    @Override
    public OrderConfirmVo confirmOrder() {
        OrderConfirmVo orderConfirmVo = new OrderConfirmVo();
        RequestAttributes requestAttribute = RequestContextHolder.getRequestAttributes();
        Long userId = LoginUserInterceptor.loginUser.get();
        CompletableFuture<Void> t1 = CompletableFuture.runAsync(() -> {
            // 远程调用查询收货地址列表
            RequestContextHolder.setRequestAttributes(requestAttribute);
            R r1 = memberFeignService.getAddress(userId);
            if (r1.getCode() == 0) {
                orderConfirmVo.setAddresses(r1.getData(new TypeReference<List<MemberAddressVo>>() {
                }));
            }
        }, executor);

        CompletableFuture<Void> t2 = CompletableFuture.runAsync(() -> {
            // 远程调用查询所有购物项
            RequestContextHolder.setRequestAttributes(requestAttribute);
            R r2 = cartFeignService.list();
            if (r2.getCode() == 0) {
                orderConfirmVo.setOrderItems(r2.getData(new TypeReference<List<OrderItemVo>>() {
                }));
            }
        }, executor).thenRunAsync(() -> {
            // 远程调用查库存
            List<OrderItemVo> items = orderConfirmVo.getOrderItems();
            List<Long> ids = items.stream().map(item -> item.getSkuId()).collect(Collectors.toList());
            R r3 = wareFeignService.getSkuHasStock(ids);
            if (r3.getCode() == 0) {
                Map<Long, Boolean> data = r3.getData(new TypeReference<Map<Long, Boolean>>() {
                });
                orderConfirmVo.setStocks(data);
            }
        });

        try {
            CompletableFuture.allOf(t1, t2).get();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }

        String token = UUID.randomUUID().toString().replace("-", "");
        orderConfirmVo.setOrderToken(token);
        redisTemplate.opsForValue().set(OrderConstant.USER_ORDER_TOKEN_PREFIX + userId, token,
                30, TimeUnit.MINUTES);

        return orderConfirmVo;
    }

    /**
     * 提交订单
     */
    @Override
    @Transactional
    public SubmitOrderResponseVo submitOrder(OrderSubmitVo vo) {
        orderSubmitVoThreadLocal.set(vo);

        SubmitOrderResponseVo response = new SubmitOrderResponseVo();
        // token是做幂等性处理的参数，由 confirmOrder 接口生成（上一步的接口）
        String voToken = vo.getOrderToken();
        Long userId = LoginUserInterceptor.loginUser.get();
        // 查-比-删，全部成功返回1，这里是有并发问题的，必须要原子操作
        String script = "if redis.call('get',KEYS[1]) == ARGV[1] then return redis.call('del',KEYS[1]) else return 0 end";
        Long result = redisTemplate.execute(new DefaultRedisScript<>(script, Long.class),
                Collections.singletonList(OrderConstant.USER_ORDER_TOKEN_PREFIX + userId), voToken);
        if (result != null && result == 0L) {
            // 失败，幂等性对比失败，用户可能修改了token或者点太快
            response.setCode(1);
            return response;
        } else {
            // 生成订单基础信息，如订单号、收货人、价格、积分等，这个数据是可信赖的
            OrderCreateTo order = createOrder();
            BigDecimal payAmount = order.getOrder().getPayAmount();
            BigDecimal payPrice = vo.getPayPrice();
            // 对比前后端的价格，以后端为准
            if (payAmount.subtract(payPrice).abs().doubleValue() < 0.01) {
                // 金额对比容错成功 ...
                // 保存订单且锁定库存，有异常就回滚 Transactional
                WareSkuLockVo wareSkuLockVo = new WareSkuLockVo();
                wareSkuLockVo.setOrderSn(order.getOrder().getOrderSn());
                wareSkuLockVo.setLocks(order.getItems().stream().map(item -> {
                    OrderItemVo orderItemVo = new OrderItemVo();
                    orderItemVo.setSkuId(item.getSkuId());
                    orderItemVo.setCount(item.getSkuQuantity());
                    return orderItemVo;
                }).collect(Collectors.toList()));
                // 远程锁库存（创建库存工作单，发送rabbitmq死信队列消息）
                R r = wareFeignService.lockStock(wareSkuLockVo);
                if (r.getCode() == 0) {
                    // 🔐成功
                    // 1.保存订单数据
                    saveOrder(order);
                    // 2.锁库存
                    // 发送rabbitmq消息（1m后关闭订单，回滚库存）
                    response.setOrder(order.getOrder());
                    rabbitTemplate.convertAndSend("order-event-exchange",
                            "order.create.order", order.getOrder());
                    return response;
                } else {
                    // 有异常-无库存
                    response.setCode(3); //TODO
                    return response;
                }
            } else {
                // 价格校验失败
                response.setCode(2);
                return response;
            }
        }
    }

    @Override
    public OrderEntity getOrderByOrderSn(String orderSn) {
        return this.getOne(new QueryWrapper<OrderEntity>().eq("order_sn", orderSn));
    }

    /**
     * 来源于 order.release.order.queue
     * 更改订单状态，并解锁库存（这里又发了一次解锁库存的消息）
     */
    @Override
    public void closeOrder(OrderEntity o) {
        log.error("MQ消息-尝试关闭订单！");
        OrderEntity byId = this.getById(o.getId());
        // 只有新建状态的订单才能关闭
        if (Objects.equals(byId.getStatus(), OrderStatusEnum.CREATE_NEW.getCode())) {
            OrderEntity orderEntity = new OrderEntity();
            orderEntity.setId(o.getId());
            orderEntity.setStatus(OrderStatusEnum.CANCELED.getCode());
            // 订单服务数据库更改订单数据
            this.updateById(orderEntity);
            OrderTo order = new OrderTo();
            BeanUtils.copyProperties(byId, order);
            // 主动发消息给库存使其库存回滚
            try {
                // 这里再次发了一次解锁库存消息，主要用来处理【关闭订单消息由于各种原因晚于关闭库存的消息到达】
                // 订单服务给 ware 服务发送rabbitmq消息，使其回滚库存
                rabbitTemplate.convertAndSend("order-event-exchange",
                        "order.release.other", order);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public PayVo getPayVoByOrderSn(String orderSn) {
        OrderEntity orderEntity = this.getOrderByOrderSn(orderSn);
        List<OrderItemEntity> list = orderItemService.list(new QueryWrapper<OrderItemEntity>().eq("order_sn", orderSn));
        String collect = list.stream().map(OrderItemEntity::getSkuName).collect(Collectors.joining("、"));

        PayVo payVo = new PayVo();
//        payVo.setTotal_amount(orderEntity.getTotalAmount()==null?"0":orderEntity.getTotalAmount().setScale(2, RoundingMode.DOWN).toString());
        payVo.setTotal_amount(String.valueOf(orderEntity.getPayAmount().setScale(2, RoundingMode.DOWN)));
        payVo.setOut_trade_no(orderEntity.getOrderSn());
        payVo.setSubject(StringUtils.isEmpty(collect) ? "1" : collect); // 订单标题
        payVo.setBody("");  // 订单描述
        return payVo;
    }

    @Override
    public PageUtils listWithItem(Map<String, Object> params) {
        Long userId = LoginUserInterceptor.loginUser.get();
        IPage<OrderEntity> page = this.page(
                new Query<OrderEntity>().getPage(params),
                new QueryWrapper<OrderEntity>().eq("member_id", userId).
                        orderByDesc("id")
        );
        List<OrderEntity> collect = page.getRecords().stream().peek(item -> {
            List<OrderItemEntity> list = orderItemService.list(new QueryWrapper<OrderItemEntity>().eq("order_sn", item.getOrderSn()));
            item.setItemEntities(list);
        }).collect(Collectors.toList());


        return new PageUtils(page);
    }

    /**
     * 处理支付宝异步回调
     *
     * @param vo
     */
    @Override
    public void saveOrderStatusAndPaymentEntity(PayAsyncVo vo) {
        // 1.设置交易流水
        PaymentInfoEntity infoEntity = new PaymentInfoEntity();
        infoEntity.setAlipayTradeNo(vo.getTrade_no());
        infoEntity.setOrderSn(vo.getOut_trade_no());
        infoEntity.setPaymentStatus(vo.getTrade_status());
        infoEntity.setCallbackTime(vo.getNotify_time());
        paymentInfoService.save(infoEntity);
        // 2.修改订单状态
        if (vo.getTrade_status().equals("TRADE_SUCCESS") ||
                vo.getTrade_status().equals("TRADE_FINISHED")) {
            String out_trade_no = vo.getOut_trade_no();
            // 订单状态修改后，mq监听解锁的库存的方法便不会执行实际解锁逻辑
            this.baseMapper.updateOrderStatus(out_trade_no, OrderStatusEnum.PAYED.getCode());
        }
    }

    /**
     * 削峰建单
     */
    @Override
    public void createSeckillOrder(QuickOrderTo to) {
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderSn(to.getOrderSn());
        orderEntity.setMemberId(to.getMemberId());
        orderEntity.setStatus(OrderStatusEnum.CREATE_NEW.getCode());
        orderEntity.setPayAmount(to.getSeckillPrice().multiply(BigDecimal.valueOf(to.getNum())));

        this.save(orderEntity);

        OrderItemEntity orderItemEntity = new OrderItemEntity();
        orderItemEntity.setOrderSn(to.getOrderSn());
        orderItemEntity.setRealAmount(orderEntity.getPayAmount());
        orderItemEntity.setSkuQuantity(to.getNum());
        orderItemEntity.setSkuId(to.getSkuId());
        // TODO 查询SKU详细信息并保存
        orderItemService.save(orderItemEntity);
    }

    /**
     * 数据库生成订单
     * 包含订单info和订单items
     */
    private void saveOrder(OrderCreateTo order) {
        OrderEntity orderEntity = order.getOrder();
        orderEntity.setModifyTime(new Date());
        orderDao.insert(orderEntity);

        List<OrderItemEntity> items = order.getItems();
        orderItemService.saveBatch(items);
    }

    private OrderCreateTo createOrder() {
        OrderCreateTo orderCreateTo = new OrderCreateTo();
        // 1.生成订单号
        String orderSn = IdWorker.getTimeId();
        // 2.构建收货人信息
        OrderEntity o = buildOrder(orderSn);
        // 3.构建订单项
        List<OrderItemEntity> orderItemEntities = buildOrderItems(orderSn);
        // 4.验价
        computePrice(o, orderItemEntities);

        orderCreateTo.setOrder(o);
        orderCreateTo.setItems(orderItemEntities);
        orderCreateTo.setFare(o.getFreightAmount());
        orderCreateTo.setPayPrice(o.getPayAmount());

        return orderCreateTo;
    }

    /**
     * 设置购物项价格、积分、状态
     */
    private void computePrice(OrderEntity orderEntity, List<OrderItemEntity> orderItemEntities) {
        BigDecimal total = BigDecimal.ZERO;

        BigDecimal couponAmount = BigDecimal.ZERO;
        BigDecimal integrationAmount = BigDecimal.ZERO;
        BigDecimal promotionAmount = BigDecimal.ZERO;

        Integer giftGrowth = 0;
        Integer giftIntegration = 0;

        for (OrderItemEntity o : orderItemEntities) {
            couponAmount = couponAmount.add(o.getCouponAmount());
            integrationAmount = integrationAmount.add(o.getIntegrationAmount());
            promotionAmount = promotionAmount.add(o.getPromotionAmount());
            total = total.add(o.getRealAmount());

            giftGrowth += o.getGiftGrowth();
            giftIntegration += o.getGiftIntegration();
        }
        orderEntity.setTotalAmount(total); // 商品总价（未减免）
        orderEntity.setPayAmount(total.add(orderEntity.getFreightAmount())); // 应付总价
        orderEntity.setPromotionAmount(promotionAmount); // 阶梯价减免
        orderEntity.setCouponAmount(couponAmount);  // 优惠券减免价
        orderEntity.setIntegrationAmount(integrationAmount); // 积分减免价

        orderEntity.setIntegration(giftIntegration); // 设置购物积分
        orderEntity.setGrowth(giftGrowth); // 设置成长积分
        orderEntity.setDeleteStatus(0); // 订单是否删除

    }

    /**
     * 设置基础信息：收货人、收货地、生成订单号
     */
    private OrderEntity buildOrder(String orderSn) {
        Long userId = LoginUserInterceptor.loginUser.get();
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderSn(orderSn);
        orderEntity.setMemberId(userId);
        OrderSubmitVo orderSubmitVo = orderSubmitVoThreadLocal.get();
        R r1 = wareFeignService.getFare(orderSubmitVo.getAddrId());
        if (r1.getCode() == 0) {
            AddressFareVo data = r1.getData(new TypeReference<AddressFareVo>() {
            });
            // 设置收货人信息
            orderEntity.setFreightAmount(data.getFare());
            orderEntity.setReceiverCity(data.getAddressVo().getCity());
            orderEntity.setReceiverDetailAddress(data.getAddressVo().getDetailAddress());
            orderEntity.setReceiverName(data.getAddressVo().getName());
            orderEntity.setReceiverPhone(data.getAddressVo().getPhone());
            orderEntity.setReceiverPostCode(data.getAddressVo().getPostCode());
            orderEntity.setReceiverProvince(data.getAddressVo().getProvince());
            orderEntity.setReceiverRegion(data.getAddressVo().getRegion());
        } else {
            log.error("远程调用r1出错");
        }
        orderEntity.setStatus(OrderStatusEnum.CREATE_NEW.getCode());
        orderEntity.setConfirmStatus(14);

        return orderEntity;
    }

    /**
     * 最后查询并设置每个订单项的信息
     */
    private List<OrderItemEntity> buildOrderItems(String orderSn) {
        // 【最后】确定每个购物项的价格
        R r2 = cartFeignService.list();
        List<OrderItemEntity> collect = new ArrayList<>();
        if (r2.getCode() == 0) {
            List<CartItemVo> data = r2.getData(new TypeReference<List<CartItemVo>>() {
            });
            if (CollectionUtils.isNotEmpty(data)) {
                collect = data.stream().map(i -> {
                    OrderItemEntity itemEntity = buildOrderItem(i);
                    itemEntity.setOrderSn(orderSn);
                    return itemEntity;
                }).collect(Collectors.toList());

            }
        } else {
            log.error("远程调用cartFeignService.list()出错");
        }
        return collect;
    }

    /**
     * 查询订单项详细属性并进行对拷
     */
    private OrderItemEntity buildOrderItem(CartItemVo i) {
        OrderItemEntity itemEntity = new OrderItemEntity();
        // 2.商品SPU信息
        Long skuId = i.getSkuId();
        R r = productFeignService.getSpuInfoBySkuId(skuId);
        if (r.getCode() == 0) {
            SpuInfoVo data = r.getData(new TypeReference<SpuInfoVo>() {
            });
            itemEntity.setSpuId(data.getId());
            itemEntity.setSpuBrand(data.getBrandId().toString());
            itemEntity.setSpuName(data.getSpuName());
            itemEntity.setCategoryId(data.getCatalogId());
        } else {
            log.error("远程调用出错:productFeignService.getSpuInfoBySkuId");
        }
        // 3.商品SKU信息
        itemEntity.setSkuId(skuId);
        itemEntity.setSkuName(i.getTitle());
        itemEntity.setSkuPic(i.getImage());
        itemEntity.setSkuPrice(i.getPrice());
        String skuAttr = StringUtils.collectionToDelimitedString(i.getSkuAttr(), ";");
        itemEntity.setSkuAttrsVals(skuAttr);
        itemEntity.setSkuQuantity(i.getCount());
        // 4.优惠信息[none]
        // 5.积分信息
        itemEntity.setGiftGrowth(i.getPrice().multiply(BigDecimal.valueOf(i.getCount())).intValue());
        itemEntity.setGiftIntegration(i.getPrice().multiply(BigDecimal.valueOf(i.getCount())).intValue());
        // 6.订单项的价格信息
        itemEntity.setPromotionAmount(BigDecimal.ZERO);
        itemEntity.setCouponAmount(BigDecimal.ZERO);
        itemEntity.setIntegrationAmount(BigDecimal.ZERO);

        BigDecimal origin = itemEntity.getSkuPrice().  // 实际金额
                multiply(BigDecimal.valueOf(itemEntity.getSkuQuantity()));
        BigDecimal subtract = origin.subtract(itemEntity.getCouponAmount()).
                subtract(itemEntity.getPromotionAmount()).
                subtract(itemEntity.getIntegrationAmount());
        itemEntity.setRealAmount(subtract);

        return itemEntity;
    }

}