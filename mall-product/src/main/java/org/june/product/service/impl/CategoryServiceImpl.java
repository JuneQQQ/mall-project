package org.june.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.product.dao.CategoryDao;
import org.june.product.entity.CategoryEntity;
import org.june.product.service.CategoryBrandRelationService;
import org.june.product.service.CategoryService;
import org.june.product.vo.front.Catalog2Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    CategoryBrandRelationService categoryBrandRelationService;
    @Autowired
    StringRedisTemplate redis;
//    @Autowired
//    RedissonClient redisson;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }



    // 批量删除
    @Override
    public void removeMenuByIds(List<Long> asList) {
        // 逻辑删除
        baseMapper.deleteBatchIds(asList);
    }

    /**
     * 传入第三级分类id，返回与其关联的1，2，3级id
     * 5-> 1,2,5
     */
    @Override
    public Long[] getCatalogPath(Long catalogId) {
        List<Long> paths = new ArrayList<>();
//        findParentPath(catalogId,paths); 递归写法
        CategoryEntity byId = this.getById(catalogId);

        while (byId.getParentCid() != 0) {
            paths.add(byId.getCatId());
            byId = this.getById(byId.getParentCid());
        }
        paths.add(byId.getCatId());
        Collections.reverse(paths);

        return paths.toArray(new Long[0]);
    }

    @Override
    @Transactional
    @Caching(evict = {
            @CacheEvict(value = "category", key = "'LevelOneCategories'"),
            @CacheEvict(value = "category", key = "'CatalogJson'"),
    })
//    @CacheEvict(value = "{category}",allEntries = true)  // 另一种写法
    public void updateCascade(CategoryEntity category) {
        // 级联更新所有关联数据
        // category
        this.updateById(category);
        // pms_category_brand_relation
        categoryBrandRelationService.updateCategory(category.getCatId(), category.getName());
    }

    @Override
    @Cacheable(value = "category", key = "'LevelOneCategories'")
    public List<CategoryEntity> getLevelOneCategories() {
        return baseMapper.selectList(new QueryWrapper<CategoryEntity>().eq("parent_cid", 0).
                orderByAsc("sort"));
    }


    /**
     * 首页Hover查询三级分类，本地锁实现！
     */
    @Override
    @Cacheable(value = "category", key = "'CatalogJson'", sync = true)
    public Map<String, List<Catalog2Vo>> getCatalogJson() {
        // 如果能进入这里，那redis中必然没有缓存
        /////////业务开始//////////
        // 先拿到所有分类
        List<CategoryEntity> all = baseMapper.selectList(new QueryWrapper<CategoryEntity>().
                orderByAsc("`sort`"));
        // 再从中找出所有一级分类
        List<CategoryEntity> level1Categories = getParentCid(all, 0L);
        // 按order排序
//        level1Categories.sort((o1, o2) -> o1.getSort()>o2.getSort()?1:0);
        // 以一级分类id为key，List<Catalog2Vo>为value
        /////////业务结束//////////
        return level1Categories.stream().
                collect(Collectors.toMap(k -> k.getCatId().toString(), v -> {
            // 找到当前一级分类下的二级分类
            List<CategoryEntity> l2s = getParentCid(all, v.getCatId());
            // 封装二级、三级分类开始
            List<Catalog2Vo> catalog2Vos = null;
            if (CollectionUtils.isNotEmpty(l2s)) {
                catalog2Vos = l2s.stream().map(l2 -> {
                    /////////////// 组装开始 /////////////////
                    Catalog2Vo catalog2Vo = new Catalog2Vo(
                            l2.getCatId().toString(),
                            l2.getName(),
                            v.getCatId().toString(),
                            null
                    );
                    // 获取所有三级分类entity
                    List<CategoryEntity> l3s = getParentCid(all, l2.getCatId());
                    if (CollectionUtils.isNotEmpty(l3s)) {
                        List<Catalog2Vo.Catalog3Vo> catalog3Vos = l3s.stream().map(l3 ->
                                        new Catalog2Vo.Catalog3Vo(
                                                l2.getCatId().toString(),
                                                l3.getCatId().toString(),
                                                l3.getName()))
                                .collect(Collectors.toList());
                        catalog2Vo.setCatalog3List(catalog3Vos);
                    }
                    /////////////// 组装结束 /////////////////
                    return catalog2Vo;
                }).collect(Collectors.toList());
            }
            return catalog2Vos;
        }));
    }


    /**
     * 传入总集合，返回父id为指定值的entity集合
     */
    private List<CategoryEntity> getParentCid(List<CategoryEntity> selectList, Long parent_cid) {
        return selectList.stream().filter(item ->
                Objects.equals(item.getParentCid(), parent_cid)).collect(Collectors.toList());
    }


    /**
     * 递归查找catalogId为指定值的三级分类集合 5->1,3,5
     */
    private List<Long> findParentPath(Long catalogId, List<Long> paths) {
        CategoryEntity byId = this.getById(catalogId);
        if (byId.getParentCid() != 0) {
            findParentPath(byId.getParentCid(), paths);
        }
        paths.add(catalogId);

        return paths;
    }

    // 后台三级分类
    @Override
    public List<CategoryEntity> listWithTree() {
        //1.查出所有分类
        List<CategoryEntity> total = categoryDao.selectList(null);
        //2.组装成三级结构
        return total.stream()
                .filter(categoryEntity -> categoryEntity.getParentCid() == 0)
                .peek(menu -> menu.setChildren(getChildren(menu, total)))
                .sorted(Comparator.comparingInt(o -> (o.getSort() == null ? 0 : o.getSort())))
                .collect(Collectors.toList());
    }

    /**
     * 递归查找参数一的子菜单
     */
    private List<CategoryEntity> getChildren(CategoryEntity root, List<CategoryEntity> total) {
        if (root.getCatLevel() == 3) return null; // 第三级分类不要再遍历了
        return total.stream()
                // 递归跳出条件在这，filter，当遍历到第三级分类时，已经没有子分类的id等于第三级分类的id了
                .filter(categoryEntity -> Objects.equals(categoryEntity.getParentCid(), root.getCatId()))
                .peek((categoryEntity) -> categoryEntity.setChildren(getChildren(categoryEntity, total)))
                .sorted(Comparator.comparingInt(o -> (o.getSort() == null ? 0 : o.getSort())))
                .collect(Collectors.toList());
    }

}