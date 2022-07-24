package org.june.order.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("mall-cart")
public interface CartFeignService {
    @GetMapping("/cart/list")
    R list();
}
