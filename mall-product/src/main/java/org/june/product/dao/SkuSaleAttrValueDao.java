package org.june.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.june.product.entity.SkuSaleAttrValueEntity;
import org.june.product.vo.front.SkuItemSaleAttrsVo;

import java.util.List;

/**
 * sku销售属性&值
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
@Mapper
public interface SkuSaleAttrValueDao extends BaseMapper<SkuSaleAttrValueEntity> {

    List<SkuItemSaleAttrsVo> getSaleAttrsBySpuId(@Param("spuId") Long spuId);

    List<String> getSkuSaleAttrValues(@Param("skuId") Long skuId);
}
