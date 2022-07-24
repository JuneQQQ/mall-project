package org.june.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.product.entity.CommentReplayEntity;

/**
 * 商品评价回复关系
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
@Mapper
public interface CommentReplayDao extends BaseMapper<CommentReplayEntity> {

}
