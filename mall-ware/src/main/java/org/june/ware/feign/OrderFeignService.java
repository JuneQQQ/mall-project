package org.june.ware.feign;

import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient("mall-order")
public interface OrderFeignService {
    @GetMapping("/order/order/status/{orderSn}")
    R getOrderStatus(@PathVariable("orderSn") String orderSn);

}
