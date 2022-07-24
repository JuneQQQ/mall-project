package org.june.seckill.interceptor;

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

        AntPathMatcher ant = new AntPathMatcher();
        String uri = request.getRequestURI();
        boolean match = ant.match("/kill", uri);
        if (match) {
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
        return true;
    }
}
