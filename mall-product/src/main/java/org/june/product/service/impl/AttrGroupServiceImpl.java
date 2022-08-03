package org.june.product.service.impl;

import com.alibaba.nacos.common.utils.CollectionUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.product.dao.AttrGroupDao;
import org.june.product.entity.AttrEntity;
import org.june.product.entity.AttrGroupEntity;
import org.june.product.service.AttrGroupService;
import org.june.product.service.AttrService;
import org.june.product.vo.back.AttrGroupWithAttrsVo;
import org.june.product.vo.front.SpuGroupBaseAttrVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;


@Service("attrGroupService")
public class AttrGroupServiceImpl extends ServiceImpl<AttrGroupDao, AttrGroupEntity> implements AttrGroupService {
    @Autowired
    private AttrService attrService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrGroupEntity> page = this.page(
                new Query<AttrGroupEntity>().getPage(params),
                new QueryWrapper<AttrGroupEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Long catalogId) {
        QueryWrapper<AttrGroupEntity> wrapper = new QueryWrapper<>();
        IPage<AttrGroupEntity> page;
        String key = (String) params.get("key");
        Optional.ofNullable(key).ifPresent(k->wrapper.and(obj -> obj.eq("attr_group_id", k).or().like("attr_group_name", k)));
//        if (!StringUtils.isEmpty(key)) {
//            wrapper.and(obj -> obj.eq("attr_group_id", key).or().like("attr_group_name", key));
//        }
        // 0查所有 非0查指定
        if (catalogId != 0) {
            wrapper.eq("catalog_id", catalogId);
            // SELECT attr_group_id,attr_group_name,sort,descript,icon,catalog_id FROM pms_attr_group WHERE
            // ((attr_group_id = ? OR attr_group_name LIKE ?) AND catalog_id = ?)
        }
        page = this.page(new Query<AttrGroupEntity>().getPage(params), wrapper);
        return new PageUtils(page);
    }

    /**
     * 根据catalogId查出所有其下相关联的属性分组及分组下属性
     */
    @Override
    public List<AttrGroupWithAttrsVo> getAttrGroupWithAttrsByCatalogId(Long catalogId) {
        // 1.查出所有关联信息
        List<AttrGroupEntity> attrGroupEntities = this.list(new QueryWrapper<AttrGroupEntity>().
                eq("catalog_id", catalogId));
        // 2.返回关联信息下的属性
        return attrGroupEntities.stream().map(item -> {
                    AttrGroupWithAttrsVo attrGroupWithAttrsVo = new AttrGroupWithAttrsVo();
                    BeanUtils.copyProperties(item, attrGroupWithAttrsVo);
                    // 查询分组下属性
                    List<AttrEntity> relationAttr = attrService.getRelationAttr(item.getAttrGroupId());
                    attrGroupWithAttrsVo.setAttrs(relationAttr);
                    return attrGroupWithAttrsVo;
                }).filter(item -> CollectionUtils.isNotEmpty(item.getAttrs()))  // 空分组不返回，否则前端报错
                .collect(Collectors.toList());
    }

    @Override
    public List<SpuGroupBaseAttrVo> getAttrGroupWithAttrsBySpuId(Long spuId, Long catalogId) {
        return this.baseMapper.getAttrGroupWithAttrsBySpuId(spuId, catalogId);
    }


}