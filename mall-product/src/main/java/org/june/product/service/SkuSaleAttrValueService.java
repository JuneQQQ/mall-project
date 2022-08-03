package org.june.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.product.entity.SkuSaleAttrValueEntity;
import org.june.product.vo.front.SkuItemSaleAttrsVo;

import java.util.List;
import java.util.Map;

/**
 * sku销售属性&值
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
public interface SkuSaleAttrValueService extends IService<SkuSaleAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<SkuItemSaleAttrsVo> getSaleAttrsBySpuId(Long spuId);

    List<String> getSkuSaleAttrValues(Long skuId);

    List<SkuSaleAttrValueEntity> getSaleAttrsBatch(List<Long> skuIdList);
}

