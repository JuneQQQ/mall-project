package org.june.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.to.QuickOrderTo;
import org.june.common.utils.PageUtils;
import org.june.order.entity.OrderEntity;
import org.june.order.vo.*;

import java.util.Map;

/**
 * 订单
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:59:42
 */
public interface OrderService extends IService<OrderEntity> {

    PageUtils queryPage(Map<String, Object> params);

    OrderConfirmVo confirmOrder();

    SubmitOrderResponseVo submitOrder(OrderSubmitVo vo);

    OrderEntity getOrderByOrderSn(String orderSn);

    void closeOrder(OrderEntity o);

    PayVo getPayVoByOrderSn(String orderSn);

    PageUtils listWithItem(Map<String, Object> params);

    void saveOrderStatusAndPaymentEntity(PayAsyncVo vo);

    void createSeckillOrder(QuickOrderTo to);
}

