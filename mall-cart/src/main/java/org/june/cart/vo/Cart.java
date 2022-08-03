package org.june.cart.vo;

import io.jsonwebtoken.lang.Collections;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 商品总价动态计算，不需要传入
 */
@Data
public class Cart {
    List<CartItem> items;  // 购物车商品项
    Integer itemCount; // 商品数量
    Integer itemTypeCount; // 商品类型数量
    BigDecimal totalPrice; // 总价
    BigDecimal reduce = new BigDecimal("0"); // 减免价格

    public Integer getItemCount() {
        int count = 0;
        if (!Collections.isEmpty(items)) {
            for (CartItem item : items) {
                count += item.getCount();
            }
        }
        return count;
    }

    public Integer getItemTypeCount() {
        return items.size();
    }

    public BigDecimal getTotalPrice() {
        // 1.商品总价
        BigDecimal price = new BigDecimal("0");
        if (!Collections.isEmpty(items)) {
            for (CartItem item : items) {
                if (item.getCheck()) {
                    price = price.add(item.getTotalPrice());
                }
            }
        }
        // 2.减免价格
        price = price.subtract(this.getReduce());

        return price;
    }


}
