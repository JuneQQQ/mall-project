package org.june.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.product.entity.AttrEntity;
import org.june.product.vo.back.AttrGroupRelationVo;
import org.june.product.vo.back.AttrResponseVo;
import org.june.product.vo.back.AttrVo;

import java.util.List;
import java.util.Map;

/**
 * 商品属性
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:45
 */
public interface AttrService extends IService<AttrEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveAttrVo(AttrVo attr);

    PageUtils queryBaseAttrPage(String attrType, Long catalogId, Map<String, Object> params);

    AttrResponseVo getAttrInfo(Long attrId);

    void updateAttr(AttrVo attr);

    List<AttrEntity> getRelationAttr(Long attrgroupId);

    void deleteRelation(AttrGroupRelationVo[] vos);

    PageUtils getNoRelationAttr(Long attrgroupId, Map<String, Object> params);

    List<Long> selectSearchableBaseAttrs(List<Long> attrIds);
}

