package org.june.ware.controller;

import org.june.common.exception.StatusCode;
import org.june.common.utils.PageUtils;
import org.june.common.utils.R;
import org.june.ware.entity.WareSkuEntity;
import org.june.ware.service.WareSkuService;
import org.june.ware.vo.SkuVo;
import org.june.ware.vo.WareSkuLockVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 商品库存
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
@RestController
@RequestMapping("ware/waresku")
public class WareSkuController {
    @Autowired
    private WareSkuService wareSkuService;

    @PostMapping("/default/stock")
    public R addDefaultStock(@RequestBody List<SkuVo> skus) {
        wareSkuService.addDefaultStock(skus);
        return R.ok();
    }

    @PostMapping("/lock/order")
    public R lockStock(@RequestBody WareSkuLockVo vo) {
        try {
            wareSkuService.lockStock(vo);
        } catch (Exception e) {
            return R.error(StatusCode.NO_STOCK_EXCEPTION.getCode(),
                    StatusCode.NO_STOCK_EXCEPTION.getMsg());
        }
        return R.ok();
    }

    /**
     * 查询 sku 是否有库存
     */
    @PostMapping("/hasStock")
    public R getSkuHasStock(@RequestBody List<Long> skuIds) {
        Map<Long, Boolean> map = wareSkuService.getSkuHasStock(skuIds);
        return R.ok().setData(map);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wareSkuService.queryPageByCondition(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        WareSkuEntity wareSku = wareSkuService.getById(id);

        return R.ok().put("wareSku", wareSku);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WareSkuEntity wareSku) {
        wareSkuService.save(wareSku);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody WareSkuEntity wareSku) {
        wareSkuService.updateById(wareSku);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        wareSkuService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
