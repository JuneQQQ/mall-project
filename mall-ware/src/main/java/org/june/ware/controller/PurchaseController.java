package org.june.ware.controller;

import org.june.common.utils.PageUtils;
import org.june.common.utils.R;
import org.june.ware.entity.PurchaseEntity;
import org.june.ware.service.PurchaseService;
import org.june.ware.vo.MergeVo;
import org.june.ware.vo.PurchaseDoneVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 采购信息
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
@RestController
@RequestMapping("ware/purchase")
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;

    /**
     * 采购完成
     * Long id;//采购单id
     * List<PurchaseItemDoneVo> items;
     * <p>
     * Long itemId;
     * Integer status;  //状态[0新建，1已分配，2正在采购，3已完成，4采购失败]
     * String reason;
     * <p>
     * 示例JSON
     * {
     * "id": 22,
     * "items": [
     * {
     * "itemId": 58,
     * "status": 4,
     * "reason": "无货"
     * },
     * {
     * "itemId": 59,
     * "status": 3,
     * "reason": "正常"
     * }
     * ]
     * }
     */
    @PostMapping("/done")
    public R received(@RequestBody PurchaseDoneVo doneVo) {
        purchaseService.done(doneVo);
        return R.ok();
    }

    /**
     * 更新采购单s涉及的采购需求的状态
     *
     * @param ids 采购单s
     * @return ok or error
     */
    @PostMapping("/received")
    public R received(@RequestBody List<Long> ids) {
        purchaseService.received(ids);
        return R.ok();
    }

    /**
     * 采购需求合并
     * Long purchaseId;  // 合并到哪个采购单上
     * List<Long> items;  // 要合并的采购需求id
     *
     * @return ok or error
     */
    @PostMapping("/merge")
    public R merge(@RequestBody MergeVo mergeVo) {
        purchaseService.merge(mergeVo);
        return R.ok();
    }

    /**
     * 查询没有领取的采购单
     *
     * @param params 分页参数
     * @return PageUtils
     */
    @RequestMapping("/unreceive/list")
    public R unreceivedList(@RequestParam Map<String, Object> params) {
        PageUtils page = purchaseService.queryPageUnreceived(params);

        return R.ok().put("page", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = purchaseService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        PurchaseEntity purchase = purchaseService.getById(id);

        return R.ok().put("purchase", purchase);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody PurchaseEntity purchase) {
        purchaseService.save(purchase);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody PurchaseEntity purchase) {
        purchaseService.updateById(purchase);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        purchaseService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
