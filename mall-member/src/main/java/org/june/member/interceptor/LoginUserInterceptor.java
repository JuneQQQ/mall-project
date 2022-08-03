package org.june.member.interceptor;

import org.june.common.constant.AuthenticCommonConstant;
import org.june.common.vo.MemberRespVo;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Component
public class LoginUserInterceptor implements HandlerInterceptor {
    public static ThreadLocal<Long> loginUser = new ThreadLocal<>();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        boolean match = new AntPathMatcher().match("/member/**", uri);
        if (match) {
            return true;
        }
        // 有没有内存泄漏的可能？
        // 首先ThreadLocal内存泄漏发生在线程迟迟不释放的场景，像线程池这种，而我并没有使用线程池；
        // 而且，我的判断登录首先从session中获取登录信息，若有，则保存到threadlocal中，给后续逻辑使用
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
    }
}
