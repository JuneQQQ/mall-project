package org.june.search.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient("mall-product")
public interface ProductFeignService {
    @GetMapping("/product/attr/info/{attrId}")
    R attrInfo(@PathVariable("attrId") Long attrId);
}
