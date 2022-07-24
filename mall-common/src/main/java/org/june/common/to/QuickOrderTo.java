package org.june.common.to;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class QuickOrderTo {
    private String orderSn; // 订单号
    private Long skuId;   // 商品信息
    private Long promotionSessionId; // 秒杀场次
    private BigDecimal seckillPrice; // 秒杀价
    private Integer num;  // 秒杀数量
    private Long memberId; // 会员id
}
