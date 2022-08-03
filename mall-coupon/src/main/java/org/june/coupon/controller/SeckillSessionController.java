package org.june.coupon.controller;

import org.june.common.utils.PageUtils;
import org.june.common.utils.R;
import org.june.coupon.entity.SeckillSessionEntity;
import org.june.coupon.service.SeckillSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 秒杀活动场次
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:55:01
 */
@RestController
@RequestMapping("coupon/seckillsession")
public class SeckillSessionController {
    @Autowired
    SeckillSessionService seckillSessionService;

    /**
     * 找出start_time从今天0:00到三天后0:00区间内的session（秒杀场次）
     */
    @GetMapping("/latestDaySession")
    public R getLatestNDaySession(@RequestParam("days") Integer days) {
        List<SeckillSessionEntity> session = seckillSessionService.getLatestNDaySession(days);
        return R.ok().setData(session);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = seckillSessionService.queryPage(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        SeckillSessionEntity seckillSession = seckillSessionService.getById(id);

        return R.ok().put("seckillSession", seckillSession);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SeckillSessionEntity seckillSession) {
        seckillSessionService.save(seckillSession);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SeckillSessionEntity seckillSession) {
        seckillSessionService.updateById(seckillSession);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        seckillSessionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
