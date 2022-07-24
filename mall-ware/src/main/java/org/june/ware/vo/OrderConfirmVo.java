package org.june.ware.vo;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Data
public class OrderConfirmVo {
    // 收货地址 ums_member_receive_address
    List<MemberAddressVo> addresses;
    // 购物项
    List<OrderItemVo> orderItems;

    // 积分
    Integer integral = 0;

    BigDecimal total; // 订单总额
    BigDecimal payPrice; // 应付价格

    String orderToken; // 订单令牌

    Integer count; // 总件数

    Map<Long, Boolean> stocks; // 购物车购物项库存情况

    public Integer getCount() {
        int i = 0;
        if (CollectionUtils.isNotEmpty(orderItems)) {
            for (OrderItemVo orderItem : orderItems) {
                i += orderItem.getCount();
            }
        }
        return i;
    }

    public BigDecimal getTotal() {
        BigDecimal sum = new BigDecimal("0");
        if (CollectionUtils.isNotEmpty(orderItems)) {
            for (OrderItemVo orderItem : orderItems) {
                sum = sum.add(
//                        orderItem.getPrice().multiply(BigDecimal.valueOf(orderItem.getCount()))
                        orderItem.getTotalPrice()
                );
            }
        }
        return sum;
    }

    public BigDecimal getPayPrice() {
        // 需要减去优惠信息 TODO
        return getTotal().subtract(new BigDecimal("0"));
    }
}
