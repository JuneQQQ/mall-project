package org.june.product.feign;

import org.june.common.to.SkuReductionTo;
import org.june.common.to.SpuBoundsTo;
import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient("mall-coupon")
public interface CouponFeignService {
    /**
     * product  --->   cloud   ---> coupon
     * ->SpuBoundsTo  ->Json      ->SpuBounds
     *
     * @param spuBoundsTo
     */
    @PostMapping("/coupon/spubounds/save")
    R saveSpuBounds(@RequestBody SpuBoundsTo spuBoundsTo);

    @PostMapping("/coupon/skufullreduction/saveinfo")
    R saveSkuReduction(SkuReductionTo skuReductionTo);
}
