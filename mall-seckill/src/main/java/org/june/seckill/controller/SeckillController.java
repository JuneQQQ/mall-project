package org.june.seckill.controller;

import org.june.common.utils.R;
import org.june.seckill.service.SeckillService;
import org.june.seckill.to.SeckillSkuRedisTo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SeckillController {
    @Autowired
    SeckillService seckillService;

    @GetMapping(value = "/hello/{name}")
    @ResponseBody
    public String apiHello(@PathVariable String name) {
        return "hello!" + name;
    }

    /**
     * 秒杀方法 url:kill?killId=31-2&randomCode=bc8114eff5f64c1cba576f6ae2e649fd&num=2
     */
    @GetMapping("/kill")
    public String seckill(@RequestParam("killId") String killId,
                          @RequestParam("randomCode") String randomCode,
                          @RequestParam("num") Integer num,
                          Model model) {
        String orderSn = seckillService.kill(killId, randomCode, num);
        model.addAttribute("orderSn", orderSn);
        return "success";
    }

    /**
     * 首页查询：当前时间可以参与的秒杀商品
     */
    @GetMapping("/currentSeckillSkus")
    @ResponseBody
    public R getCurrentSeckillSkus() {
        List<SeckillSkuRedisTo> vos = seckillService.getCurrentSeckillSkus();
        return R.ok().setData(vos);
    }

    /**
     * 获取参与秒杀的商品的详情
     */
    @GetMapping("/sku/seckill/{skuId}")
    @ResponseBody
    public R getSkuSeckillInfo(@PathVariable("skuId") Long skuId) {
        SeckillSkuRedisTo to = seckillService.getSkuSeckillInfo(skuId);
        return R.ok().setData(to);
    }
}
