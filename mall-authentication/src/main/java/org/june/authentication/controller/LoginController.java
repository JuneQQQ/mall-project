package org.june.authentication.controller;

import com.alibaba.fastjson.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.june.authentication.constant.AuthenticationConstant;
import org.june.authentication.feign.MemberFeignService;
import org.june.authentication.feign.ThirdPartFeignService;
import org.june.authentication.vo.UserLoginVo;
import org.june.authentication.vo.UserRegisterVo;
import org.june.common.constant.AuthenticCommonConstant;
import org.june.common.exception.StatusCode;
import org.june.common.utils.JwtUtils;
import org.june.common.utils.R;
import org.june.common.utils.RandomUtils;
import org.june.common.vo.MemberRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
@Slf4j
public class LoginController {
    @Autowired
    ThirdPartFeignService thirdPartFeignService;
    @Autowired
    StringRedisTemplate redis;
    @Autowired
    MemberFeignService memberFeignService;

//    @ApiOperation("根据请求（头）获取用户信息")
//    @GetMapping("getMemberInfo")
//    public ResultEntity getMemberInfo(HttpServletRequest request) {
//        String memberId = JwtUtils.getMemberIdByJwtToken(request);
//        UcenterMember member = ucenterMemberService.getById(memberId);
//        return ResultEntity.ok().data("userInfo", member);
//    }


    @PostMapping("/login")
    public String login(UserLoginVo vo, HttpSession session) {
        R login = null;
        try {
            login = memberFeignService.login(vo);
            log.info("登录信息：" + login);
        } catch (Exception e) {
            log.error("member微服务校验用户信息失败！错误信息：" + e.getLocalizedMessage());
        }
        if (login.getCode() == 0) {
            // SpringSession 对 session 做了增强，在指定域名下，多个微服务共享session（redis存储session）1
            session.setAttribute(AuthenticCommonConstant.LOGIN_USER,
                    login.getData(new TypeReference<MemberRespVo>() {
                    }));
            return "redirect:http://projectdemo.top";
        } else {
            Map<String, String> errors = new HashMap<>();
            errors.put("msg", login.getData("msg", new TypeReference<String>() {
            }));
            log.warn("用户登录失败：\n账号:" + vo.getUsername() +
                    "\n密码:" + vo.getPassword() +
                    "\n错误信息：" + errors);
            session.setAttribute("errors", errors);
            return "redirect:http://auth.projectdemo.top/login.html";
        }
    }

    @GetMapping("/login.html")
    public String loginHtml(HttpSession session) {
        if (session.getAttribute(AuthenticCommonConstant.LOGIN_USER) == null) {
            return "login";
        } else {
            return "redirect:http://projectdemo.top";
        }
    }



    @GetMapping("/sms/sendCode")
    @ResponseBody
    public R sendCode(@RequestParam("phone") String phone) {
        // 1.接口防刷
        // 2.验证码再次校验 sms-code:xxxxxx
        String code = RandomUtils.getSixBitRandom();
        String key = AuthenticCommonConstant.SMS_CODE_CACHE_PREFIX + phone;
        Long expire = redis.getExpire(key); //单位 s
        // 短信默认5min超时；若已发送，那么必须等待60s，才可以重发
        if (expire == null || AuthenticationConstant.SMS_CODE_EXPIRE_MINUTES * 60 - expire >= 60L) {
            redis.opsForValue().set(key, code,
                    AuthenticationConstant.SMS_CODE_EXPIRE_MINUTES, TimeUnit.MINUTES);
            thirdPartFeignService.sendCode(phone, code);
            return R.ok();
        } else {
            return R.error(StatusCode.SMS_CODE_TO_OFTEN_EXCEPTION.getMsg());
        }
    }


    @PostMapping("/register")
    public String register(@Valid UserRegisterVo vo, BindingResult result, HttpSession session) {
        log.info("有用户注册，提交的用户信息：" + vo);
        Map<String, String> errors = new HashMap<>();
        if (result.hasErrors()) {
            // 有错误，转发注册页并附加错误信息
            for (FieldError fieldError : result.getFieldErrors()) {
                String field = fieldError.getField();
                String defaultMessage = fieldError.getDefaultMessage();
                errors.put(field, defaultMessage);
            }
            log.error("注册发生错误,错误信息："+errors);
            session.setAttribute("errors", errors);
            return "redirect:http://auth.projectdemo.top/register.html";
        }

        // 正确性校验
        String code = vo.getCode();
        String s = redis.opsForValue().get(AuthenticCommonConstant.SMS_CODE_CACHE_PREFIX + vo.getPhone());
        if (StringUtils.isNotEmpty(s) && code.equals(s)) {
            // 校验部分成功，最后调用远程服务注册校验重名情况并删除验证码
            R r = memberFeignService.register(vo);
            log.info("远程调用注册接口返回信息：" + r);
            if (r.getCode() == 0) {
                // 注册成功
                redis.delete(AuthenticCommonConstant.SMS_CODE_CACHE_PREFIX + vo.getPhone());
                return "redirect:http://auth.projectdemo.top/login.html?from=register.html";
            } else {
                errors.put("msg", r.getData(new TypeReference<String>() {
                }));
                session.setAttribute("errors", errors);
                log.error("注册发生错误,错误信息："+errors);
                return "redirect:http://auth.projectdemo.top/register.html";
            }
        } else {
            errors.put("code", "验证码错误");
            log.error("注册发生错误,错误信息："+errors);
            return "redirect:http://auth.projectdemo.top/register.html";
        }


    }
}
