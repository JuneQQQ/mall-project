package org.june.product.fallback;

import lombok.extern.slf4j.Slf4j;
import org.june.common.exception.StatusCode;
import org.june.common.utils.R;
import org.june.product.feign.SeckillFeignService;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class SeckillFallbackService implements SeckillFeignService {

    @Override
    public R getSkuSeckillInfo(Long skuId) {
        log.error("SeckillFallbackService熔断！");
        return R.error(StatusCode.TOO_MANY_REQUEST.getCode(), StatusCode.TOO_MANY_REQUEST.getMsg());
    }
}
