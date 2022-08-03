package org.june.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.coupon.entity.SpuBoundsEntity;

import java.util.Map;

/**
 * 商品spu积分设置
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:55:01
 */
public interface SpuBoundsService extends IService<SpuBoundsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

