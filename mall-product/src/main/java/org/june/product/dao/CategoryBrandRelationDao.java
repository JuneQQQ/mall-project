package org.june.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.june.product.entity.CategoryBrandRelationEntity;

/**
 * Æ·ÅÆ·ÖÀà¹ØÁª
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-12 22:04:23
 */
@Mapper
public interface CategoryBrandRelationDao extends BaseMapper<CategoryBrandRelationEntity> {

    void updateCategoryWithSQL(@Param("catId") Long catId, @Param("catalogName") String name);
}
