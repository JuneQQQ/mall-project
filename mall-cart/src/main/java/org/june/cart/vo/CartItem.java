package org.june.cart.vo;

import lombok.Data;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;

/**
 * 总价已经动态计算，不需要传入
 */
@Data
@ToString
public class CartItem {
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
