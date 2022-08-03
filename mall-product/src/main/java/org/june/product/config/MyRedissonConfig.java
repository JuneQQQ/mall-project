//package org.june.product.config;
//
//import org.redisson.Redisson;
//import org.redisson.api.RedissonClient;
//import org.redisson.config.Config;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class MyRedissonConfig {
//    @Value("${spring.redis.host}")
//    String host;
//    @Value("${spring.redis.port}")
//    String port;
//    @Bean
//    RedissonClient redisson() {
//        Config config = new Config();
//        config.useSingleServer()
//                .setAddress("redis://"+host+":"+port);
//        return Redisson.create(config);
//    }
//}
