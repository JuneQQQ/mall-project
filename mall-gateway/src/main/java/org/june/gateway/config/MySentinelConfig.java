package org.june.gateway.config;

import com.alibaba.fastjson.JSON;
import org.june.common.exception.StatusCode;
import org.june.common.utils.R;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

//@Configuration
//public class MySentinelConfig {
//    public MySentinelConfig() {
//        GatewayCallbackManager.setBlockHandler((serverWebExchange, throwable) -> {
//            R error = R.error(StatusCode.TOO_MANY_REQUEST.getCode(), StatusCode.TOO_MANY_REQUEST.getMsg());
//            String errJson = JSON.toJSONString(error);
//            return ServerResponse.ok().body(Mono.just(errJson), String.class);
//        });
//    }
//}
