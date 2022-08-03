package org.june.order.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderSubmitVo {
    private Long addrId; // 地址信息
    private Integer payType; // 支付方式
    // 无须提交要购买的商品，去购物车时再查一遍
    // 优惠、发票
    private String orderToken; // 防重复令牌
    private BigDecimal payPrice; // 应付价格 验价
    private String node; // 订单备注
    // 用户信息，从session取
}
