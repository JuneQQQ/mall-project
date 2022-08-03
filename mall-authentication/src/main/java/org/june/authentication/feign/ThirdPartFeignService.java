package org.june.authentication.feign;


import org.june.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient("mall-third-party")
public interface ThirdPartFeignService {
    @RequestMapping("/sms/code")
    R sendCode(@RequestParam("phone") String phone, @RequestParam("code") String code);
}
