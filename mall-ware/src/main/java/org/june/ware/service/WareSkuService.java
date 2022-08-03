package org.june.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.ware.entity.PurchaseDetailEntity;
import org.june.ware.entity.WareSkuEntity;
import org.june.ware.vo.SkuVo;
import org.june.ware.vo.WareSkuLockVo;

import java.util.List;
import java.util.Map;

/**
 * 商品库存
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
public interface WareSkuService extends IService<WareSkuEntity> {

    PageUtils queryPageByCondition(Map<String, Object> params);

    void addStock(PurchaseDetailEntity byId);

    Map<Long, Boolean> getSkuHasStock(List<Long> skuIds);

    boolean lockStock(WareSkuLockVo vo);

    void unlockStock(Long skuId, Long wareId, Integer num, Long taskDetailId);

    void addDefaultStock(List<SkuVo> skus);
}

