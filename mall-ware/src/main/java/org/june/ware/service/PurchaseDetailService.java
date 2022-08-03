package org.june.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.ware.entity.PurchaseDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
public interface PurchaseDetailService extends IService<PurchaseDetailEntity> {

    PageUtils queryPageCondition(Map<String, Object> params);

    List<PurchaseDetailEntity> listDetailByPurchaseId(Long id);
}

