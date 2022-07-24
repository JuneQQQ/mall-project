package org.june.authentication.feign;

import org.june.authentication.vo.UserLoginVo;
import org.june.authentication.vo.UserRegisterVo;
import org.june.common.utils.R;
import org.june.common.vo.MemberRespVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient("mall-member")
public interface MemberFeignService {
    @PostMapping("/member/member/register")
    R register(@RequestBody UserRegisterVo vo);

    @PostMapping("/member/member/login")
    R login(@RequestBody UserLoginVo vo);

    @GetMapping("/member/member/info/fromOpenId/{openId}")
    R getOpenIdMember(@PathVariable("openId") String openid);

    @PostMapping("/member/member/save")
    R save(@RequestBody MemberRespVo u);

    @GetMapping("/member/member/info/{id}")
    R getById(@PathVariable("id") Long memberId);


}
