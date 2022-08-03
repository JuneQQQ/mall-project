package org.june.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.june.common.constant.ProductConstant;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.product.dao.AttrAttrgroupRelationDao;
import org.june.product.dao.AttrDao;
import org.june.product.dao.AttrGroupDao;
import org.june.product.dao.CategoryDao;
import org.june.product.entity.AttrAttrgroupRelationEntity;
import org.june.product.entity.AttrEntity;
import org.june.product.entity.AttrGroupEntity;
import org.june.product.entity.CategoryEntity;
import org.june.product.service.AttrService;
import org.june.product.service.CategoryService;
import org.june.product.vo.back.AttrGroupRelationVo;
import org.june.product.vo.back.AttrResponseVo;
import org.june.product.vo.back.AttrVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;


@Service("attrService")
public class AttrServiceImpl extends ServiceImpl<AttrDao, AttrEntity> implements AttrService {
    @Autowired
    AttrAttrgroupRelationDao relationDao;
    @Autowired
    AttrGroupDao attrGroupDao;
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    CategoryService categoryService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                new QueryWrapper<AttrEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void saveAttrVo(AttrVo attr) {
        AttrEntity attrEntity = new AttrEntity();
        BeanUtils.copyProperties(attr, attrEntity);
        this.save(attrEntity);

        // 修改关联表，分组关联表的字段仅和【规格参数】关联
        if (attr.getAttrGroupId() != null &&
                attr.getAttrType() == ProductConstant.AttrEnum.ATTR_TYPE_BASE.getCode()
        ) {
            AttrAttrgroupRelationEntity relationEntity = new AttrAttrgroupRelationEntity();
            relationEntity.setAttrGroupId(attr.getAttrGroupId());
            relationEntity.setAttrId(attrEntity.getAttrId());
            relationDao.insert(relationEntity);
        }
    }

    @Override
    public PageUtils queryBaseAttrPage(String attrType, Long catalogId, Map<String, Object> params) {
        QueryWrapper<AttrEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("attr_type", "base".equalsIgnoreCase(attrType) ?
                ProductConstant.AttrEnum.ATTR_TYPE_BASE.getCode() : ProductConstant.AttrEnum.ATTR_TYPE_SALE.getCode());
        if (catalogId != 0 && attrType != null) {
            wrapper.eq("catalog_id", catalogId);
        }
        String key = (String) params.get("key");
        Optional.ofNullable(key).ifPresent(none -> {
                    if (none.length() > 0)
                        wrapper.and(obj ->
                                obj.eq("attr_id", key).or().like("attr_name", key));
                }
        );

        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                wrapper
        );
        PageUtils pageUtils = new PageUtils(page);
        List<AttrEntity> records = page.getRecords();

        List<AttrResponseVo> list = records.stream().map(attr -> {
            AttrResponseVo attrResponseVo = new AttrResponseVo();
            BeanUtils.copyProperties(attr, attrResponseVo);
            // 获取分组名（需要先查询关联表获取分组id，再查询分组表获取分组名）
            if ("base".equalsIgnoreCase(attrType)) {
                AttrAttrgroupRelationEntity relationEntity = relationDao.selectOne(
                        new QueryWrapper<AttrAttrgroupRelationEntity>().
                                // create index idx_attrGroupId_attrId on pms_attr_attrgroup_relation(attr_group_id,attr_id)
                                // create index idx_attrId_attrGroupId on pms_attr_attrgroup_relation(attr_id,attr_group_id)
                                        select("attr_group_id", "attr_id").
                                eq("attr_id", attr.getAttrId())
                );
                // 组id不为空才修改分组关联表（前台可以不指定组id提交的）
                if (relationEntity != null && relationEntity.getAttrGroupId() != null) {
                    AttrGroupEntity attrGroupEntity = attrGroupDao.selectById(relationEntity.getAttrGroupId());
                    if (attrGroupEntity != null) {
                        attrResponseVo.setGroupName(attrGroupEntity.getAttrGroupName());
                    }
                }
            }
            // 查询分类名（根据分类ID查询分组表）
            CategoryEntity categoryEntity = categoryDao.selectById(attr.getCatalogId());
            Optional.ofNullable(categoryEntity).ifPresent(none ->
                    attrResponseVo.setCatalogName(categoryEntity.getName()));
            return attrResponseVo;
        }).collect(Collectors.toList());

        pageUtils.setList(list);
        return pageUtils;
    }

    @Override
    public AttrResponseVo getAttrInfo(Long attrId) {
        AttrEntity attrEntity = this.getById(attrId);
        AttrResponseVo attrResponseVo = new AttrResponseVo();
        BeanUtils.copyProperties(attrEntity, attrResponseVo);

        if (attrEntity.getAttrType() == ProductConstant.AttrEnum.ATTR_TYPE_BASE.getCode()) {
            // 1.设置分组 attrGroupName（基本属性才有分组）
            AttrAttrgroupRelationEntity relationEntity = relationDao.selectOne(new QueryWrapper<AttrAttrgroupRelationEntity>().eq("attr_id", attrId));
            if (relationEntity != null) {
                attrResponseVo.setAttrGroupId(relationEntity.getAttrGroupId());

                AttrGroupEntity attrGroupEntity = attrGroupDao.selectById(relationEntity.getAttrGroupId());
                if (attrGroupEntity != null) {
                    attrResponseVo.setGroupName(attrGroupEntity.getAttrGroupName());
                }
            }
        }
        // 2.设置分类 catalogPath
        Long[] catalogPath = categoryService.getCatalogPath(attrEntity.getCatalogId());
        attrResponseVo.setCatalogPath(catalogPath);
        CategoryEntity categoryEntity = categoryDao.selectById(attrEntity.getCatalogId());
        if (categoryEntity != null) {
            attrResponseVo.setCatalogName(categoryEntity.getName());
        }

        return attrResponseVo;
    }

    @Override
    @Transactional
    public void updateAttr(AttrVo attr) {
        AttrEntity attrEntity = new AttrEntity();
        BeanUtils.copyProperties(attr, attrEntity);
        this.updateById(attrEntity);

        if (attrEntity.getAttrType() == ProductConstant.AttrEnum.ATTR_TYPE_BASE.getCode()) {
            // 修改分组
            AttrAttrgroupRelationEntity relationEntity = new AttrAttrgroupRelationEntity();
            relationEntity.setAttrGroupId(attr.getAttrGroupId());
            relationEntity.setAttrId(attr.getAttrId());
            // 防止分组字段原本就没有值，就需要判断是新增还是修改
            Long count = relationDao.selectCount(new QueryWrapper<AttrAttrgroupRelationEntity>().eq("attr_id", attr.getAttrId()));
            if (count > 0) {
                // 修改分组关联
                relationDao.update(relationEntity, new QueryWrapper<AttrAttrgroupRelationEntity>().eq("attr_id", attr.getAttrId()));
            } else {
                // 新增分组关联
                relationDao.insert(relationEntity);
            }
        }

    }

    /**
     * 根据分组Id找到关联的所有 基本属性
     * @param attrgroupId 分组id
     * @return List<AttrEntity>
     */
    @Override
    public List<AttrEntity> getRelationAttr(Long attrgroupId) {
        List<AttrAttrgroupRelationEntity> list = relationDao.selectList(new QueryWrapper<AttrAttrgroupRelationEntity>().
                eq("attr_group_id", attrgroupId));
        List<Long> attrIds = list.stream().map(AttrAttrgroupRelationEntity::getAttrId).collect(Collectors.toList());

        List<AttrEntity> attrEntities = null;
        if (CollectionUtils.isNotEmpty(attrIds)) {
            attrEntities = this.listByIds(attrIds);
        }
        return attrEntities;
    }

    /**
     * 批量删除
     * Long attrId;
     * Long attrGroupId;
     * @param vos
     */
    @Override
    public void deleteRelation(AttrGroupRelationVo[] vos) {
        // 封装 AttrAttrgroupRelationEntity
        List<AttrAttrgroupRelationEntity> collect = Arrays.stream(vos).map(item -> {
            AttrAttrgroupRelationEntity relationEntity = new AttrAttrgroupRelationEntity();
            BeanUtils.copyProperties(item, relationEntity);
            return relationEntity;
        }).collect(Collectors.toList());

        relationDao.deleteBatchRelation(collect);
    }

    /**
     * 查询没有被使用的属性
     * 1.当前分组只能关联自己所属分类的属性
     * 2.当前分组只能关联别的分组没有引用的属性
     * 记录一下相关联的SQL，如果以后有调优的必要
     * SELECT attr_group_id,attr_group_name,sort,descript,icon,catalog_id FROM pms_attr_group WHERE attr_group_id=6;
     * --  ------------------------------------------------------------------------------------------------
     * SELECT attr_group_id,attr_group_name,sort,descript,icon,catalog_id FROM pms_attr_group WHERE (catalog_id = 1439);
     * --  ------------------------------------------------------------------------------------------------
     * SELECT id,attr_id,attr_group_id,attr_sort FROM pms_attr_attrgroup_relation WHERE (attr_group_id IN (6,7));
     * --  ------------------------------------------------------------------------------------------------
     * SELECT COUNT(*) AS total FROM pms_attr WHERE (catalog_id = 1439 AND attr_type = 1 AND attr_id NOT IN (13, 14, 15, 16, 17, 18));
     */
    @Override
    public PageUtils getNoRelationAttr(Long attrgroupId, Map<String, Object> params) {
        // 查所有id是【attrgroupId】的分组
        AttrGroupEntity attrGroupEntity = attrGroupDao.selectById(attrgroupId);
        // 查询【catalog】分类id
        Long catalogId = attrGroupEntity.getCatalogId();
        // 找到同分类下的其他分组
        List<AttrGroupEntity> otherGroupsAndSelf = attrGroupDao.selectList(new QueryWrapper<AttrGroupEntity>().
                eq("catalog_id", catalogId));
        // 获取已经被关联了的属性
        List<Long> linkedGroupIds = otherGroupsAndSelf.stream().map(AttrGroupEntity::getAttrGroupId).collect(Collectors.toList());

        // 找到已产生关联的属性id
        List<AttrAttrgroupRelationEntity> linkedGroupRelations = relationDao.selectList(
                new QueryWrapper<AttrAttrgroupRelationEntity>().in("attr_group_id", linkedGroupIds));
        List<Long> linkedAttrIds = linkedGroupRelations.stream().map(AttrAttrgroupRelationEntity::getAttrId).collect(Collectors.toList());

        // 查询属性表中没有产生关联的并且与传入分组属于同一分类下的【基本属性（规格参数）】
        QueryWrapper<AttrEntity> wrapper = new QueryWrapper<AttrEntity>().eq("catalog_id", catalogId).eq("attr_type", ProductConstant.AttrEnum.ATTR_TYPE_BASE.getCode());
        if (CollectionUtils.isNotEmpty(linkedAttrIds)) {
            wrapper.notIn("attr_id", linkedAttrIds);
        }
        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            wrapper.and(w -> w.eq("attr_id", key).or().like("attr_name", key));
        }

        IPage<AttrEntity> page = this.page(new Query<AttrEntity>().getPage(params), wrapper);

        return new PageUtils(page);
    }

    /**
     * 在给定ids中找到 searchType 为1的
     *
     * @param attrIds
     * @return
     */
    @Override
    public List<Long> selectSearchableBaseAttrs(List<Long> attrIds) {
        return this.baseMapper.selectSearchableAttrs(attrIds);
    }

}