package org.june.product.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.common.utils.R;
import org.june.product.dao.SkuInfoDao;
import org.june.product.entity.SkuInfoEntity;
import org.june.product.feign.SeckillFeignService;
import org.june.product.service.*;
import org.june.product.vo.front.SeckillInfoVo;
import org.june.product.vo.front.SkuItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;


@Slf4j
@Service("skuInfoService")
public class SkuInfoServiceImpl extends ServiceImpl<SkuInfoDao, SkuInfoEntity> implements SkuInfoService {
    @Autowired
    ThreadPoolExecutor executor;
    @Autowired
    private SkuImagesService skuImagesService;
    @Autowired
    private SpuInfoService spuInfoService;
    @Autowired
    private SpuInfoDescService spuInfoDescService;
    @Autowired
    private AttrGroupService attrGroupService;
    @Autowired
    private SkuSaleAttrValueService skuSaleAttrValueService;
    @Autowired
    private SeckillFeignService seckillFeignService;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuInfoEntity> page = this.page(
                new Query<SkuInfoEntity>().getPage(params),
                new QueryWrapper<SkuInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {
        log.info("查询条件："+params);
        QueryWrapper<SkuInfoEntity> wrapper = new QueryWrapper<>();
        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            wrapper.and(i -> i.eq("sku_id", key).or().eq("sku_name", key));
        }
        String catalogId = (String) params.get("catalogId");
        if (StringUtils.isNotEmpty(catalogId)&&!"0".equalsIgnoreCase(catalogId)) {
            wrapper.eq("catalog_id", catalogId);
        }
        String brandId = (String) params.get("brandId");
        if (StringUtils.isNotEmpty(brandId)&&!"0".equalsIgnoreCase(brandId)) {
            wrapper.eq("brand_id", brandId);
        }
        String min = (String) params.get("min");
        String max = (String) params.get("max");
        if (new BigDecimal(min).compareTo(new BigDecimal(max)) <= 0) {
            if (StringUtils.isNotEmpty(min)) {
                wrapper.ge("price", min);
            }
            if (StringUtils.isNotEmpty(max)) {
                wrapper.le("price", max);
            }
        } else {
            log.error("价格传入参数有误！已忽略。");
        }

        IPage<SkuInfoEntity> page = this.page(new Query<SkuInfoEntity>().getPage(params), wrapper);
        return new PageUtils(page);
    }

    @Override
    public List<SkuInfoEntity> getSkusBySpuId(Long spuId) {
        return this.list(new QueryWrapper<SkuInfoEntity>().eq("spu_id", spuId));
    }

    @Override
    @Cacheable(value = "sku",key = "#skuId")
    public SkuItemVo item(Long skuId) {
        SkuItemVo skuItemVo = new SkuItemVo();
        CompletableFuture<SkuInfoEntity> infoFuture = CompletableFuture.supplyAsync(() -> {
            // sku基本信息获取 pms_sku_info
            SkuInfoEntity info = getById(skuId);
            skuItemVo.setInfo(info);
            return info;
        }, executor);

        CompletableFuture<Void> saleAttrFuture = infoFuture.thenAcceptAsync(info -> {
            // 获取 spu 销售属性组合
            skuItemVo.setSaleAttrs(skuSaleAttrValueService.getSaleAttrsBySpuId(info.getSpuId()));
        }, executor);

        CompletableFuture<Void> spuDescFuture = infoFuture.thenAcceptAsync(info -> {
            // 获取spu介绍
            Long spuId = info.getSpuId();
            skuItemVo.setDesp(spuInfoDescService.getById(spuId));
        }, executor);

        CompletableFuture<Void> baseAttrFuture = infoFuture.thenAcceptAsync(info -> {
            // 获取spu规格参数信息
            skuItemVo.setBaseAttrs(attrGroupService.getAttrGroupWithAttrsBySpuId(info.getSpuId(), info.getCatalogId()));
        }, executor);

        CompletableFuture<Void> imgFuture = CompletableFuture.runAsync(() -> {
            // sku图片信息 pms_sku_images
            skuItemVo.setImages(skuImagesService.getImagesBySkuId(skuId));
        }, executor);

        CompletableFuture<Void> seckillFuture = CompletableFuture.runAsync(() -> {
            // 查询当前sku是否参与秒杀优惠
            R r = seckillFeignService.getSkuSeckillInfo(skuId);
            if (r.getCode() == 0) {
                SeckillInfoVo data = r.getData(new TypeReference<SeckillInfoVo>() {
                });
                skuItemVo.setSeckillInfoVo(data);
            }
        }, executor);

        try {
            // 等待所有任务完成
            CompletableFuture.allOf(infoFuture, saleAttrFuture, spuDescFuture, baseAttrFuture, imgFuture, seckillFuture).get();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
        return skuItemVo;
    }


}