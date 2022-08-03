package org.june.seckill.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient("mall-coupon")
public interface CouponFeignService {

    /**
     * @return 找出start_time从今天0:00到三天后0:00区间内的session（秒杀场次）
     */
    @GetMapping("/coupon/seckillsession/latestDaySession")
    R getLatestNDaySession(@RequestParam("days") Integer days);
}
