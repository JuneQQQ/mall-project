package org.june.member.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient("mall-coupon")
public interface CouponService {
    @RequestMapping("coupon/coupon/member/list")
    R memberCoupons();
}
