package org.june.member.controller;

import lombok.extern.slf4j.Slf4j;
import org.june.common.exception.StatusCode;
import org.june.common.utils.PageUtils;
import org.june.common.utils.R;
import org.june.common.vo.MemberRespVo;
import org.june.member.entity.MemberEntity;
import org.june.member.entity.MemberReceiveAddressEntity;
import org.june.member.feign.CouponService;
import org.june.member.service.MemberReceiveAddressService;
import org.june.member.service.MemberService;
import org.june.member.vo.MemberLoginVo;
import org.june.member.vo.MemberRegisterVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 会员
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:00:34
 */
@RestController
@RequestMapping("member/member")
@Slf4j
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private CouponService couponService;

    @Autowired
    private MemberReceiveAddressService memberReceiveAddressService;

    @PostMapping("/login")
    R login(@RequestBody MemberLoginVo vo) {
        MemberEntity login = memberService.login(vo);
        if (login != null) {
            return R.ok().setData(login);
        } else {
            return R.error(StatusCode.USERNAME_PASSWORD_INVALID_EXCEPTION.getCode(), StatusCode.USERNAME_PASSWORD_INVALID_EXCEPTION.getMsg());
        }
    }

    @PostMapping("/register")
    public R register(@RequestBody MemberRegisterVo vo) {
        memberService.register(vo);
        return R.ok();
    }

    @RequestMapping("/coupons")
    public R test() {
        MemberEntity memberEntity = new MemberEntity();
        memberEntity.setNickname("张三");
        R memberCoupons = couponService.memberCoupons();

        return R.ok().put("member", memberEntity).put("coupons", memberCoupons.get("coupons"));
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = memberService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/info/fromOpenId/{openId}")
    R getOpenIdMember(@PathVariable("openId") String openid) {
        MemberEntity m = memberService.getOpenIdMember(openid);
        MemberRespVo memberRespVo = new MemberRespVo();
        if (m != null) {
            BeanUtils.copyProperties(m, memberRespVo);
        }
        return R.ok().setData(memberRespVo);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        MemberEntity member = memberService.getById(id);

        return R.ok().setData(member);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody MemberEntity member) {
        memberService.save(member);
        // 添加默认收货地址
        memberReceiveAddressService.save(new MemberReceiveAddressEntity(null, member.getId(), "default", "110", "123"
                , "上海市", "陆家嘴", "456", "滨江大道汤臣一品", "789", 1));
        return R.ok().put("memberId", member.getId());
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody MemberEntity member) {
        memberService.updateById(member);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        memberService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
