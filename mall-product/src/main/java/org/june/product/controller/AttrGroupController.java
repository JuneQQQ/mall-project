package org.june.product.controller;

import org.june.common.utils.PageUtils;
import org.june.common.utils.R;
import org.june.product.entity.AttrEntity;
import org.june.product.entity.AttrGroupEntity;
import org.june.product.service.AttrAttrgroupRelationService;
import org.june.product.service.AttrGroupService;
import org.june.product.service.AttrService;
import org.june.product.service.CategoryService;
import org.june.product.vo.back.AttrGroupRelationVo;
import org.june.product.vo.back.AttrGroupWithAttrsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 属性分组
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:45
 */
@RestController
@RequestMapping("product/attrgroup")
public class AttrGroupController {
    @Autowired
    AttrService attrService;
    @Autowired
    private AttrGroupService attrGroupService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AttrAttrgroupRelationService attrAttrgroupRelationService;

    @RequestMapping("/{attrgroupId}/attr/relation")
    public R attrRelation(@PathVariable("attrgroupId") Long attrgroupId) {
        List<AttrEntity> entityList = attrService.getRelationAttr(attrgroupId);
        return R.ok().put("data", entityList);
    }

    /**
     * 列表
     *    catalogId:0orOther //0查所有，否则查传入值
     *
     *    page: 1,//当前页码
     *    limit: 10,//每页记录数
     *    sidx: 'id',//排序字段  没有传入不排序
     *    order: 'asc/desc',//排序方式  没有传入不排序
     *    key: '华为'//检索关键字
     */
    @RequestMapping("/list/{catalogId}")
    public R list(@PathVariable("catalogId") Long catalogId, @RequestParam Map<String, Object> params) {
//        PageUtils page = attrGroupService.queryPage(params);
        PageUtils page = attrGroupService.queryPage(params, catalogId);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{attrGroupId}")
    public R info(@PathVariable("attrGroupId") Long attrGroupId) {
        AttrGroupEntity attrGroup = attrGroupService.getById(attrGroupId);
        Long catalogId = attrGroup.getCatalogId();
        Long[] path = categoryService.getCatalogPath(catalogId);
        attrGroup.setCatalogPath(path);

        return R.ok().put("attrGroup", attrGroup);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody AttrGroupEntity attrGroup) {
        attrGroupService.save(attrGroup);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody AttrGroupEntity attrGroup) {
        attrGroupService.updateById(attrGroup);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] attrGroupIds) {
        attrGroupService.removeByIds(Arrays.asList(attrGroupIds));

        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/attr/relation/delete")
    public R delete(@RequestBody AttrGroupRelationVo[] vos) {
        attrService.deleteRelation(vos);
        return R.ok();
    }


    /**
     * 查询没有被使用的属性
     * @param attrgroupId 当前分组
     * @param params  分组参数
     */
    @RequestMapping("/{attrgroupId}/noattr/relation")
    public R delete(@PathVariable("attrgroupId") Long attrgroupId,
                    @RequestParam Map<String, Object> params) {
        PageUtils page = attrService.getNoRelationAttr(attrgroupId, params);
        return R.ok().put("page", page);
    }

    @PostMapping("/attr/relation")
    public R addRelation(@RequestBody List<AttrGroupRelationVo> vos) {
        attrAttrgroupRelationService.saveBatch(vos);
        return R.ok();
    }


    /**
     * 查询当前分组的所有属性
     * @param catalogId
     * @return List<AttrGroupWithAttrsVo>
     */
    @GetMapping("/{catalogId}/withattr")
    public R getAttrGroupWithAttrs(@PathVariable("catalogId") Long catalogId) {
        //1. 查出当前分类下的所有属性分组
        //2. 查出每个属性分组的所有属性
        List<AttrGroupWithAttrsVo> vos = attrGroupService.getAttrGroupWithAttrsByCatalogId(catalogId);
        return R.ok().put("data", vos);
    }

}
