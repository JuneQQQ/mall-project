package org.june.seckill.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "mall-product")
public interface ProductFeignService {
    @RequestMapping("/product/skuinfo/info/{skuId}")
    R skuInfo(@PathVariable("skuId") Long skuId);
}
