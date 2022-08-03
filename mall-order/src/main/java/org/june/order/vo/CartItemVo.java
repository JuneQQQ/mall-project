package org.june.order.vo;

import lombok.Data;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;

@Data
@ToString
public class CartItemVo {
    private Long skuId;
    private Boolean check;
    private String title;
    private String image;
    private List<String> skuAttr;
    private BigDecimal price;
    private Integer count;  // 单品数量
    private BigDecimal totalPrice;

    public BigDecimal getTotalPrice() {
        return this.price.multiply(BigDecimal.valueOf(this.count));
    }
}
