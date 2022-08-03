package org.june.authentication.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.june.authentication.constant.AuthenticationConstant;
import org.june.authentication.feign.MemberFeignService;
import org.june.common.constant.AuthenticCommonConstant;
import org.june.common.utils.HttpClientUtils;
import org.june.common.utils.JwtUtils;
import org.june.common.utils.R;
import org.june.common.vo.MemberRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.UUID;

/**
 * <a href="http://auth.projectdemo.top/oauth2/wx/login">
 */
@Controller
@RequestMapping("/oauth2")
@Slf4j
public class WxApiController {
    @Autowired
    private MemberFeignService memberFeignService;

    /**
     * 准备必要的参数，再重定向到微信平台获取登录二维码
     * wx.open.app_id=xxx
     * wx.open.app_secret=bbb
     * wx.open.redirect_url=http://localhost:8160/oauth2/wx/callback  * 固定值
     */
    @GetMapping("/wx/login")
    public String getWxCode(HttpSession session) {
        if (session.getAttribute(AuthenticCommonConstant.LOGIN_USER) != null) {
            // 已经有用户登录
            return "redirect:http://projectdemo.top";
        }
        // 微信开放平台授权baseUrl
        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";
        // 回调地址
        String redirectUrl = AuthenticationConstant.WX_OPEN_REDIRECT_URL; //获取业务服务器重定向地址
        try {
            redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8"); // url编码
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String state = UUID.randomUUID().toString().replaceAll("-", "");
        String qrcodeUrl = String.format(
                baseUrl,
                AuthenticationConstant.WX_OPEN_APP_ID,
                redirectUrl,
                state);
        return "redirect:" + qrcodeUrl;
    }

    /**
     * 微信平台检测到用户登录且确认，调用以下方法（本机调用）
     * 方法逻辑简单来说就是通过两次get请求微信API获取用户信息
     * 第一次：code（由上一步用户扫码后平台返回，封装在请求参数中）、appid、secret、
     * 第二次：微信返回 access_token、openid（用户id），拿着这两个参数去最终获取用户信息
     */
    @GetMapping("/wx/callback")
    public String callback(String code, String state) {
        try {
            String baseAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                    "?appid=%s" +
                    "&secret=%s" +
                    "&code=%s" +
                    "&grant_type=authorization_code";
            //拼接三个参数 ：id  秘钥 和 code值
            String accessTokenUrl = String.format(
                    baseAccessTokenUrl,
                    AuthenticationConstant.WX_OPEN_APP_ID,
                    AuthenticationConstant.WX_OPEN_APP_SECRET,
                    code);

            String accessTokenInfo = HttpClientUtils.get(accessTokenUrl);

            HashMap<String, String> hashMap = JSON.parseObject(accessTokenInfo, HashMap.class);
            String access_token = hashMap.get("access_token");
            String openid = hashMap.get("openid");
            String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo" +
                    "?access_token=%s" +
                    "&openid=%s";
            String userInfoUrl = String.format(baseUserInfoUrl, access_token, openid);

            // 用access_token 和 openid 再次请求微信API获取用户信息，返回值是JSON格式
            String userInfo = HttpClientUtils.get(userInfoUrl);

            HashMap<String, String> userMap = JSON.parseObject(userInfo, HashMap.class);
            log.info("登陆成功，用户信息：" + userMap.toString());
            String nickname = userMap.get("nickname");
            String headimgurl = userMap.get("headimgurl");

            // 检查是否已创建过绑定微信的账号
            R r = memberFeignService.getOpenIdMember(openid);
            MemberRespVo u = null;
            if (r.getCode() == 0) {
                u = r.getData(new TypeReference<MemberRespVo>() {
                });
                if (u == null || u.getId() == null) {
                    // 没有使用过微信账号登录，创建微信新用户
                    u = new MemberRespVo();
                    u.setWxOpenId(openid);
                    u.setNickname(nickname);
                    u.setHeader(headimgurl);
                    // 此处发送的对象是 MemberRespVo 而接口接收对象是 MemberEntity，修改值时需注意
                    R save = memberFeignService.save(u);
                    if (save.getCode() == 0) {
                        u.setId(Long.parseLong(String.valueOf(save.get("memberId"))));
                    }
                }
                // 这里设置 session 会由于跨域名而丢失cookie而丢失session
//                session.setAttribute(AuthenticCommonConstant.LOGIN_USER, u);
            } else {
                log.error("远程调用查询账号信息出错!");
            }
            // 当前回调函数环境为 localhost:8160... session是不能共享的，通过请求参数传递cookie
            // return "redirect:http://projectdemo.top";  // 域名不同session丢失
            // return "redirect:http://localhost:9000";   // 域名相同有session但逻辑不正确
            // 解决方案是再写一个接力接口通过请求参数共享cookie
            // 2022.8.1 线上证明，上述办法无效，回调请求目标地址为localhost:8160 无法正确调用回调函数
            return "redirect:http://auth.projectdemo.top/oauth2/wx/success.html?token=" + JwtUtils.getJwtToken(String.valueOf(u.getId()), u.getNickname());
        } catch (Exception e) {
            e.printStackTrace();
        }
        throw new RuntimeException("微信登录出错！");
    }

    /**
     * 传递session的接力方法
     */
    @GetMapping("/wx/success.html")
    public String loginWx(HttpSession session, @RequestParam("token") String token) {
        if (session.getAttribute(AuthenticCommonConstant.LOGIN_USER) == null) {
            // 目标逻辑：这是第一次登录
            Long memberId = JwtUtils.getMemberIdByJwtTokenString(token);
            R r = memberFeignService.getById(memberId);
            if (r.getCode() == 0) {
                MemberRespVo data = r.getData(new TypeReference<MemberRespVo>() {
                });
                session.setAttribute(AuthenticCommonConstant.LOGIN_USER, data);
            }
            return "redirect:http://projectdemo.top";
        } else {
            // 已经有用户登录
            log.error("禁止覆盖登录");
            return null;
        }
    }
}