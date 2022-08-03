package org.june.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.product.entity.AttrGroupEntity;
import org.june.product.vo.back.AttrGroupWithAttrsVo;
import org.june.product.vo.front.SpuGroupBaseAttrVo;

import java.util.List;
import java.util.Map;

/**
 * 属性分组
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:45
 */
public interface AttrGroupService extends IService<AttrGroupEntity> {


    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPage(Map<String, Object> params, Long catalogId);

    List<AttrGroupWithAttrsVo> getAttrGroupWithAttrsByCatalogId(Long catalogId);

    List<SpuGroupBaseAttrVo> getAttrGroupWithAttrsBySpuId(Long spuId, Long catalogId);
}

