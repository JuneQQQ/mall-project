package org.june.coupon.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.coupon.entity.MemberPriceEntity;

/**
 * 商品会员价格
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:55:02
 */
@Mapper
public interface MemberPriceDao extends BaseMapper<MemberPriceEntity> {

}
