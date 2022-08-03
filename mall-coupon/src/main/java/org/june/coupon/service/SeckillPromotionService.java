package org.june.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.coupon.entity.SeckillPromotionEntity;

import java.util.Map;

/**
 * 秒杀活动
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:55:01
 */
public interface SeckillPromotionService extends IService<SeckillPromotionEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

