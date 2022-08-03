package org.june.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.product.entity.BrandEntity;
import org.june.product.entity.CategoryBrandRelationEntity;

import java.util.List;
import java.util.Map;

/**
 * Æ·ÅÆ·ÖÀà¹ØÁª
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-12 22:04:23
 */
public interface CategoryBrandRelationService extends IService<CategoryBrandRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveDetail(CategoryBrandRelationEntity categoryBrandRelation);

    void updateBrand(Long brandId, String name);

    void updateCategory(Long catId, String name);

    List<BrandEntity> getBrandsByCatId(Long catId);
}

