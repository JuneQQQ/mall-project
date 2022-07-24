package org.june.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;


@EnableDiscoveryClient
@MapperScan("org.june.product.dao")
@SpringBootApplication
@EnableFeignClients(basePackages = "org.june.product.feign")
public class ProductApplication {
    public static void main(String[] args) {
//        System.setProperty("sun.net.client.defaultConnectTimeout", String
//                .valueOf(10000));// （单位：毫秒）
//        System.setProperty("sun.net.client.defaultReadTimeout", String
//                .valueOf(10000)); // （单位：毫秒）
        SpringApplication.run(ProductApplication.class, args);
    }

}
