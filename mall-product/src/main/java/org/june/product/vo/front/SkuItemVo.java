package org.june.product.vo.front;

import lombok.Data;
import lombok.ToString;
import org.june.product.entity.SkuImagesEntity;
import org.june.product.entity.SkuInfoEntity;
import org.june.product.entity.SpuInfoDescEntity;

import java.io.Serializable;
import java.util.List;

@Data
@ToString
public class SkuItemVo implements Serializable {
    private static final long serialVersionUID = 1L;

    SkuInfoEntity info; // sku 商品 entity

    boolean hasStock = true;

    List<SkuImagesEntity> images;  // sku 图片

    SpuInfoDescEntity desp; // spu商品描述

    List<SkuItemSaleAttrsVo> saleAttrs;  // 销售属性组合

    List<SpuGroupBaseAttrVo> baseAttrs; // spu 规格参数信息

    SeckillInfoVo seckillInfoVo; // 商品秒杀信息
}
