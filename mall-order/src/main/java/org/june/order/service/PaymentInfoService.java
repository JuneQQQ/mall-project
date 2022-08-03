package org.june.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.order.entity.PaymentInfoEntity;

import java.util.Map;

/**
 * 支付信息表
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:59:42
 */
public interface PaymentInfoService extends IService<PaymentInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

