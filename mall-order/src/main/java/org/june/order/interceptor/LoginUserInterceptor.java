package org.june.order.interceptor;

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
        boolean match = ant.match("/order/order/status/**", uri);
        boolean match0 = ant.match("/order/order/hello", uri); // 测试项
        boolean match1 = ant.match("/order/alipay/notify", uri);
        if (match || match1 || match0) {
            // 对于RabbitMQ Listener的请求不容易验证登录（和业务不是一个线程丢失了上下文），故直接放行
            return true;
        }

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
