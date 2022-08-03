package org.june.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.product.dao.SkuSaleAttrValueDao;
import org.june.product.entity.SkuSaleAttrValueEntity;
import org.june.product.service.SkuSaleAttrValueService;
import org.june.product.vo.front.SkuItemSaleAttrsVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("skuSaleAttrValueService")
public class SkuSaleAttrValueServiceImpl extends ServiceImpl<SkuSaleAttrValueDao, SkuSaleAttrValueEntity> implements SkuSaleAttrValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuSaleAttrValueEntity> page = this.page(
                new Query<SkuSaleAttrValueEntity>().getPage(params),
                new QueryWrapper<SkuSaleAttrValueEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<SkuItemSaleAttrsVo> getSaleAttrsBySpuId(Long spuId) {
        return this.baseMapper.getSaleAttrsBySpuId(spuId);
    }

    @Override
    public List<String> getSkuSaleAttrValues(Long skuId) {
        return baseMapper.getSkuSaleAttrValues(skuId);
    }

    @Override
    public List<SkuSaleAttrValueEntity> getSaleAttrsBatch(List<Long> skuIdList) {
        return baseMapper.selectList(new QueryWrapper<SkuSaleAttrValueEntity>().in("sku_id", skuIdList));
    }

}