package org.june.authentication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

import java.util.ArrayList;
import java.util.stream.Stream;

@EnableRedisHttpSession
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
public class AuthenticationApplication {
    public static void main(String[] args) {
        SpringApplication.run(AuthenticationApplication.class, args);
    }
}
