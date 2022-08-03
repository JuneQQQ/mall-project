//package org.june.seckill.config;
//
//import com.alibaba.csp.sentinel.adapter.spring.webmvc.callback.BlockExceptionHandler;
//import com.alibaba.csp.sentinel.slots.block.BlockException;
//import com.alibaba.fastjson.JSON;
//import org.june.common.exception.StatusCode;
//import org.june.common.utils.R;
//import org.springframework.context.annotation.Configuration;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@Configuration
//public class MySentinelConfig implements BlockExceptionHandler {
//    @Override
//    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, BlockException e) throws Exception {
//        R error = R.error(StatusCode.TOO_MANY_REQUEST.getCode(), StatusCode.TOO_MANY_REQUEST.getMsg());
//        httpServletResponse.setCharacterEncoding("UTF-8");
//        httpServletResponse.setContentType("application/json");
//        httpServletResponse.getWriter().write(JSON.toJSONString(error));
//    }
//}
