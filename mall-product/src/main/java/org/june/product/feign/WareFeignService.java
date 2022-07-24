package org.june.product.feign;

import org.june.common.utils.R;
import org.june.product.vo.back.spu.SkuVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient("mall-ware")
public interface WareFeignService {
    @PostMapping("/ware/waresku/hasStock")
    R getSkuHasStock(@RequestBody List<Long> skuIds);

    @PostMapping("/ware/waresku/default/stock")
    R addDefaultStock(@RequestBody List<SkuVo> skus);
}
