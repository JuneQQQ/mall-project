package org.june.cart.interceptor;

import org.june.common.constant.AuthenticCommonConstant;
import org.june.common.vo.MemberRespVo;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Component
public class CartInterceptor implements HandlerInterceptor {
    public static ThreadLocal<Long> loginUser = new ThreadLocal<>();

    /**
     * 已登录用户有 userId，未登录用户被标记为临时用户，只有 userKey
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        MemberRespVo attribute = (MemberRespVo) session.getAttribute(AuthenticCommonConstant.LOGIN_USER);
        if (attribute != null) {
            loginUser.set(attribute.getId());
            return true;
        } else {
            Map<String, String> list = new HashMap<>();
            list.put("msg", "请登录！");
            session.setAttribute("errors", list);
            response.sendRedirect("http://auth.projectdemo.top/login.html");
            return false;
        }
//        HttpSession session = request.getSession();
//        MemberRespVo memberRespVo = (MemberRespVo) session.getAttribute(AuthenticCommonConstant.LOGIN_USER);
//        UserInfoTo userInfoTo = new UserInfoTo();
//        if (memberRespVo != null) {
//            // 用户已登录
//            userInfoTo.setUserId(memberRespVo.getId());
//            userInfoTo.setTempUser(false);
//        } else {
//            // 未登录，设置 user-key
//            Cookie[] cookies = request.getCookies();
//            // 寻找是否已经设置过 user-key
//            if(!Arrays.isNullOrContainsNull(cookies)){
//                for (Cookie cookie : cookies) {
//                    // user-key
//                    String name = cookie.getName();
//                    if (name.equals(CartConstant.TEMP_USER_COOKIE_NAME)) {
//                        userInfoTo.setUserKey(cookie.getValue());
//                    }
//                }
//                if(StringUtils.isEmpty(userInfoTo.getUserKey())){
//                    userInfoTo.setUserKey(UUID.randomUUID().toString());
//                }
//                userInfoTo.setTempUser(true);
//            }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        UserInfoTo userInfoTo = threadLocal.get();
//        // 为临时用户设置浏览器端的 cookie
//        Cookie cookie;
//        if (userInfoTo.isTempUser()) {
//            cookie = new Cookie(CartConstant.TEMP_USER_COOKIE_NAME, userInfoTo.getUserKey());
//
//        }else{
//             cookie = new Cookie(CartConstant.USER_COOKIE_NAME, String.valueOf(userInfoTo.getUserId()));
//        }
//        cookie.setDomain("projectdemo.top");
//        cookie.setMaxAge(CartConstant.USER_COOKIE_TIMEOUT);
//        response.addCookie(cookie);
    }
}
