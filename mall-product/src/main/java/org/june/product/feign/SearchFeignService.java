package org.june.product.feign;

import org.june.common.to.es.SkuEsModel;
import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient("mall-search")
public interface SearchFeignService {
    @PostMapping("/search/product")
    R productUp(@RequestBody List<SkuEsModel> skuEsModelList);
}
