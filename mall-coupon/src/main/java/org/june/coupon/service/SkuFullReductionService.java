package org.june.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.to.SkuReductionTo;
import org.june.common.utils.PageUtils;
import org.june.coupon.entity.SkuFullReductionEntity;

import java.util.Map;

/**
 * 商品满减信息
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:55:01
 */
public interface SkuFullReductionService extends IService<SkuFullReductionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveReduction(SkuReductionTo skuReductionTo);
}

