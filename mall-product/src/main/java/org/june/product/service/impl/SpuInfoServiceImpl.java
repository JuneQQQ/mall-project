package org.june.product.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.june.common.constant.ProductConstant;
import org.june.common.to.SkuReductionTo;
import org.june.common.to.SpuBoundsTo;
import org.june.common.to.es.SkuEsModel;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.common.utils.R;
import org.june.product.dao.SpuInfoDao;
import org.june.product.entity.*;
import org.june.product.feign.CouponFeignService;
import org.june.product.feign.SearchFeignService;
import org.june.product.feign.WareFeignService;
import org.june.product.service.*;
import org.june.product.vo.back.spu.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;


@Slf4j
@Service("spuInfoService")
public class SpuInfoServiceImpl extends ServiceImpl<SpuInfoDao, SpuInfoEntity> implements SpuInfoService {
    @Autowired
    CategoryService categoryService;
    @Autowired
    SearchFeignService searchFeignService;
    @Autowired
    SpuInfoDescService spuInfoDescService;
    @Autowired
    SpuImagesService spuImagesService;
    @Autowired
    WareFeignService wareService;
    @Autowired
    AttrService attrService;
    @Autowired
    ProductAttrValueService productAttrValueService;
    @Autowired
    SkuInfoService skuInfoService;
    @Autowired
    SkuImagesService skuImagesService;
    @Autowired
    SkuSaleAttrValueService skuSaleAttrValueService;
    @Autowired
    CouponFeignService couponFeignService;
    @Autowired
    BrandService brandService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SpuInfoEntity> page = this.page(
                new Query<SpuInfoEntity>().getPage(params),
                new QueryWrapper<SpuInfoEntity>()
        );

        return new PageUtils(page);
    }

    /**
     * 保存商品提交Json
     */
    @Override
    @Transactional
    public void saveSpuVo(SpuSaveVo spuSaveVo) {
        //1.保存spu基本信息 pms_spu_info
        SpuInfoEntity spuInfoEntity = new SpuInfoEntity();
        BeanUtils.copyProperties(spuSaveVo, spuInfoEntity);
        spuInfoEntity.setCreateTime(new Date());
        spuInfoEntity.setUpdateTime(new Date());
        this.saveBaseSpuInfo(spuInfoEntity);

        //2.保存spu描述图片 pms_spu_info_desc
        List<String> descript = spuSaveVo.getDecript();
        SpuInfoDescEntity spuInfoDescEntity = new SpuInfoDescEntity();
        spuInfoDescEntity.setSpuId(spuInfoEntity.getId());
        spuInfoDescEntity.setDecript(String.join(",", descript));
        spuInfoDescService.saveSpuInfoDesc(spuInfoDescEntity);

        //3.保存spu图片集 pms_spu_images
        List<String> images = spuSaveVo.getImages();
        spuImagesService.saveImages(spuInfoEntity.getId(), images);

        //4.保存spu规格参数 pms_product_attr_value
        productAttrValueService.saveBaseAttrs(spuSaveVo.getBaseAttrs(), spuInfoEntity.getId());

        //5.保存spu积分信息 mall_sms -> sms_spu_bounds
        Bounds bounds = spuSaveVo.getBounds();
        if (!(bounds.getBuyBounds().compareTo(BigDecimal.ZERO) == 0 && bounds.getGrowBounds().compareTo(BigDecimal.ZERO) == 0)) {
            SpuBoundsTo spuBoundsTo = new SpuBoundsTo();
            BeanUtils.copyProperties(bounds, spuBoundsTo);
            spuBoundsTo.setSpuId(spuInfoEntity.getId());

            R r = couponFeignService.saveSpuBounds(spuBoundsTo);
            if (r.getCode() != 0) {
                log.error("远程保存【积分】信息失败");
            }
        }

        //6.保存当前【sku】信息
        List<SkuVo> skus = spuSaveVo.getSkus();
        if (CollectionUtils.isNotEmpty(skus)) {
            skus.forEach(item -> {

                //6.1 sku基本信息 pms_sku_info
                // 找到默认图片
                String defaultImg = "";
                for (Images image : item.getImages()) {
                    if (image.getDefaultImg() == 1) {
                        defaultImg = image.getImgUrl();
                    }
                }
                // 属性对拷
                SkuInfoEntity skuInfoEntity = new SkuInfoEntity();
                BeanUtils.copyProperties(item, skuInfoEntity);
                skuInfoEntity.setSpuId(spuInfoEntity.getId());
                skuInfoEntity.setBrandId(spuInfoEntity.getBrandId());
                skuInfoEntity.setCatalogId(spuInfoEntity.getCatalogId());
                skuInfoEntity.setPrice(new BigDecimal(item.getPrice()));
                skuInfoEntity.setSaleCount(0L);
                skuInfoEntity.setSkuDefaultImg(defaultImg);
                skuInfoService.save(skuInfoEntity);

                Long skuId = skuInfoEntity.getSkuId();
                item.setSkuId(skuId);

                //6.2 sku图片信息 pms_sku_images
                List<SkuImagesEntity> imagesEntities = item.getImages().stream().map(img -> {
                    SkuImagesEntity skuImagesEntity = new SkuImagesEntity();
                    skuImagesEntity.setSkuId(skuId);
                    skuImagesEntity.setImgUrl(img.getImgUrl());
                    skuImagesEntity.setDefaultImg(img.getDefaultImg());
                    return skuImagesEntity;
                    // true保留  false踢出
                }).filter(entity -> StringUtils.isNotEmpty(entity.getImgUrl())).collect(Collectors.toList());
                skuImagesService.saveBatch(imagesEntities);

                //6.3 sku销售属性信息 pms_sku_sale_attr_value
                List<Attr> attrs = item.getAttr();
                List<SkuSaleAttrValueEntity> collect = attrs.stream().map(attr -> {
                    SkuSaleAttrValueEntity skuSaleAttrValueEntity = new SkuSaleAttrValueEntity();
                    BeanUtils.copyProperties(attr, skuSaleAttrValueEntity);
                    skuSaleAttrValueEntity.setSkuId(skuId);
                    return skuSaleAttrValueEntity;
                }).collect(Collectors.toList());
                skuSaleAttrValueService.saveBatch(collect);

                //6.4 sku优惠满减信息 mall_sms -> sms_sku_ladder...
                SkuReductionTo skuReductionTo = new SkuReductionTo();
                BeanUtils.copyProperties(item, skuReductionTo);
                skuReductionTo.setSkuId(skuId);
//                if(skuReductionTo.getFullCount()<=0 && skuReductionTo.getFullPrice().compareTo(BigDecimal.ZERO) > 0){
                R r1 = couponFeignService.saveSkuReduction(skuReductionTo);
                if (r1.getCode() != 0) {
                    log.error("远程保存【优惠】信息失败");
                }
//                }
            });
        }

        // 7.为了测试方便，远程调用ware服务初始化添加100库存
        // id	sku_id	ware_id	stock	sku_name	stock_locked
        R r = wareService.addDefaultStock(skus);
        if (r.getCode() != 0) {
            log.error("默认库存失败");
        }
    }

    @Override
    public void saveBaseSpuInfo(SpuInfoEntity spuInfoEntity) {
        baseMapper.insert(spuInfoEntity);
    }

    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {
        QueryWrapper<SpuInfoEntity> wrapper = new QueryWrapper<>();
        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            wrapper.and(i -> i.eq("id", key).or().like("spu_name", key));
        }
        String status = (String) params.get("status");
        if (StringUtils.isNotEmpty(status)) {
            wrapper.eq("publish_status", status);
        }
        String brandId = (String) params.get("brandId");
        if (StringUtils.isNotEmpty(brandId) && !brandId.equals("0")) {
            wrapper.eq("brand_id", brandId);
        }
        String catalogId = (String) params.get("catalogId");
        if (StringUtils.isNotEmpty(catalogId) && !catalogId.equals("0")) {
            wrapper.eq("catalog_id", catalogId);
        }

        IPage<SpuInfoEntity> page = this.page(
                new Query<SpuInfoEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    /**
     * 商品上架 → elasticsearch
     */
    @Override
    @Transactional
    public void up(Long spuId) {
        // 1.查询spu的所有baseattr   pms_product_attr_value （此表保存spuid与baseattrid关联关系）
        List<ProductAttrValueEntity> baseAttrs =
                productAttrValueService.baseAttrListForSpu(spuId);
        // 1.1抽取baseAttrId
        List<Long> attrIds = baseAttrs.stream().
                map(ProductAttrValueEntity::getAttrId).collect(Collectors.toList());
        // 1.2查询当前 sku 的所有可被检索的【基本属性】（规格参数） pms_attr
        List<Long> finalAttrIds = attrService.selectSearchableBaseAttrs(attrIds);
        // 1.3过滤掉不可被检索的
        Set<Long> idSet = new HashSet<>(finalAttrIds);
        List<SkuEsModel.Attrs> finalAttrs = baseAttrs.stream().
                filter(item -> idSet.contains(item.getAttrId())).
                map(item -> {
                    SkuEsModel.Attrs attrs = new SkuEsModel.Attrs();
                    BeanUtils.copyProperties(item, attrs);
                    return attrs;
                }).collect(Collectors.toList());

        // 2.查出当前 spuId 对应的商品信息
        List<SkuInfoEntity> skus = skuInfoService.getSkusBySpuId(spuId);
        List<Long> skuIdList = skus.stream().
                map(SkuInfoEntity::getSkuId).
                collect(Collectors.toList());
        // 2.1 查询当前 sku 的所有可被检索的【销售属性】
        List<SkuSaleAttrValueEntity> saleAttrs = skuSaleAttrValueService.getSaleAttrsBatch(skuIdList);

        // 3.查询库存信息
        Map<Long, Boolean> map = null;
        try {
            R wareResult = wareService.getSkuHasStock(skuIdList);
            map = (Map<Long, Boolean>) wareResult.get("data");
        } catch (Exception e) {
            log.error("库存查询异常！");
            e.printStackTrace();
        }

        // 4. 封装每个 sku 信息
        Map<Long, Boolean> finalMap = map;
        List<SkuEsModel> collect = skus.stream().map(sku -> {
            SkuEsModel model = new SkuEsModel();
            BeanUtils.copyProperties(sku, model);
            // skuPrice, skuImg, hotScore
            // brandName brandImg catalogName attrs
            model.setSkuPrice(sku.getPrice());
            model.setSkuImg(sku.getSkuDefaultImg());
            assert finalMap != null;
            model.setHasStock(finalMap.get(sku.getSkuId()));
            // TODO 热度评分，暂时默认 0
            model.setHotScore(0L);
            // 查出品牌和分类的名称信息
            BrandEntity brandEntity = brandService.getById(sku.getBrandId());
            model.setBrandName(brandEntity.getName());
            model.setBrandImg(brandEntity.getLogo());
            CategoryEntity categoryEntity = categoryService.getById(model.getCatalogId());
            model.setCatalogName(categoryEntity.getName());

            List<SkuEsModel.Attrs> finalAttr1 = new ArrayList<>(finalAttrs);
            for (SkuSaleAttrValueEntity saleAttr : saleAttrs) {
                if (Objects.equals(saleAttr.getSkuId(), sku.getSkuId())) {
                    SkuEsModel.Attrs attrs = new SkuEsModel.Attrs();
                    BeanUtils.copyProperties(saleAttr, attrs);
                    finalAttr1.add(attrs);
                }
            }
            model.setAttrs(finalAttr1);
            return model;
        }).collect(Collectors.toList());

        // 5. 发送数据给 es
        log.info("this is debug item:" + JSON.toJSONString(collect));
        R result = searchFeignService.productUp(collect);
        if (result.getCode() == 0) {
            // 远程调用成功
            baseMapper.updateSpuStatus(spuId, ProductConstant.SpuStatusEnum.SPU_UP.getCode());
        } else {
            // 远程调用失败
            // TODO 重复调用\接口幂等性\重试机制
            log.error("远程调用失败");
            throw new RuntimeException("远程调用失败");
        }
    }

    @Override
    public SpuInfoEntity getSpuInfoBySkuId(Long skuId) {
        SkuInfoEntity byId = skuInfoService.getById(skuId);
        Long spuId = byId.getSpuId();
        return getById(spuId);
    }


}