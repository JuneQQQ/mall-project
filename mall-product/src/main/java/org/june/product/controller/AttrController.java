package org.june.product.controller;

import org.june.common.utils.PageUtils;
import org.june.common.utils.R;
import org.june.product.entity.ProductAttrValueEntity;
import org.june.product.service.AttrService;
import org.june.product.service.ProductAttrValueService;
import org.june.product.vo.back.AttrResponseVo;
import org.june.product.vo.back.AttrVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 商品属性
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:45
 */
@RefreshScope
@RestController
@RequestMapping("product/attr")
public class AttrController {
    @Autowired
    private AttrService attrService;
    @Autowired
    private ProductAttrValueService productAttrValueService;

    @Value("${test.name}")
    private String test;
    @RequestMapping("/test")
    public R test(){
        return R.ok().put("data",test);
    }

    /**
     * 列表
     */
    @RequestMapping("/base/listforspu/{spuId}")
    public R baseAttrlistforspu(@PathVariable("spuId") Long spuId) {
        List<ProductAttrValueEntity> list = productAttrValueService.baseAttrListForSpu(spuId);
        return R.ok().put("data", list);
    }

    /**
     * 规格参数、销售属性查询
     */
    @RequestMapping("{attrType}/list/{catalogId}")
    public R list(@PathVariable("attrType") String attrType, @PathVariable("catalogId") Long catalogId, @RequestParam Map<String, Object> params) {

        PageUtils page = attrService.queryBaseAttrPage(attrType, catalogId, params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{attrId}")
    public R info(@PathVariable("attrId") Long attrId) {
        AttrResponseVo attr = attrService.getAttrInfo(attrId);

        return R.ok().put("attr", attr);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody AttrVo attr) {
        attrService.saveAttrVo(attr);
        return R.ok();
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    public R update(@RequestBody AttrVo attr) {
        attrService.updateAttr(attr);

        return R.ok();
    }

    @PostMapping("/update/{spuId}")
    public R update(@PathVariable("spuId") Long spuId,
                    @RequestBody List<ProductAttrValueEntity> entities) {
        productAttrValueService.updateSpuAttr(spuId, entities);

        return R.ok();
    }


    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] attrIds) {
        attrService.removeByIds(Arrays.asList(attrIds));
        return R.ok();
    }


}
