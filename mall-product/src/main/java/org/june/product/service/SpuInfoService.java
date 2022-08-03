package org.june.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.product.entity.SpuInfoEntity;
import org.june.product.vo.back.spu.SpuSaveVo;

import java.util.Map;

/**
 * spu信息
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
public interface SpuInfoService extends IService<SpuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveSpuVo(SpuSaveVo spuSaveVo);

    void saveBaseSpuInfo(SpuInfoEntity spuInfo);

    PageUtils queryPageByCondition(Map<String, Object> params);

    void up(Long spuId) throws Exception;

    SpuInfoEntity getSpuInfoBySkuId(Long skuId);
}

