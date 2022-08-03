package org.june.order.vo;

import lombok.Data;

import java.util.List;

@Data
public class WareSkuLockVo {
    private String orderSn; //订单号
    private List<OrderItemVo> locks; //要锁的订单项
}
