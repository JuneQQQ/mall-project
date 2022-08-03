package org.june.order.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.order.entity.OrderItemEntity;

/**
 * 订单项信息
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:59:42
 */
@Mapper
public interface OrderItemDao extends BaseMapper<OrderItemEntity> {

}