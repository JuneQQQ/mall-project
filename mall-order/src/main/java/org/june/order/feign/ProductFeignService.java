package org.june.order.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient("mall-product")
public interface ProductFeignService {
    @GetMapping("/product/spuinfo/skuId/{id}")
    R getSpuInfoBySkuId(@PathVariable("id") Long skuId);
}
