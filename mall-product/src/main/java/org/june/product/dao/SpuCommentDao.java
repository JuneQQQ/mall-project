package org.june.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.product.entity.SpuCommentEntity;

/**
 * 商品评价
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
@Mapper
public interface SpuCommentDao extends BaseMapper<SpuCommentEntity> {

}
