package org.june.order.vo;

import lombok.Data;
import org.june.order.entity.OrderEntity;

@Data
public class SubmitOrderResponseVo {
    private OrderEntity order;
    private Integer code = 0; // 状态码
}
