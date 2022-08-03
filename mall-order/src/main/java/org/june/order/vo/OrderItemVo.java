package org.june.order.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class OrderItemVo {
    private Long skuId;
    private Boolean check;
    private String title;
    private String image;
    private List<String> skuAttr;
    private BigDecimal price;
    private Integer count;  // 单品数量
    private BigDecimal totalPrice;
    private BigDecimal weight; // 重量


    public BigDecimal getTotalPrice() {
        if (this.price == null || this.count == null) return BigDecimal.ZERO;
        return this.price.multiply(BigDecimal.valueOf(this.count));
    }
}
