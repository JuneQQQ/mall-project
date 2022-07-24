package org.june.order.to;

import lombok.Data;
import org.june.order.entity.OrderEntity;
import org.june.order.entity.OrderItemEntity;

import java.math.BigDecimal;
import java.util.List;

@Data
public class OrderCreateTo {
    private OrderEntity order;
    private List<OrderItemEntity> items;
    private BigDecimal payPrice;
    private BigDecimal fare; // 运费
}
