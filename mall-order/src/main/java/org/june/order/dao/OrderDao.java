package org.june.order.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.june.order.entity.OrderEntity;

/**
 * 订单
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:59:42
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {

    void updateOrderStatus(@Param("outTradeNo") String outTradeNo, @Param("code") Integer code);
}
