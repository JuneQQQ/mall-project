package org.june.seckill.config;

import lombok.extern.slf4j.Slf4j;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

@Configuration
@Slf4j
public class MyRedissonConfig {
//    @Bean  // 单节点
//    RedissonClient redisson() {
//        log.error(String.valueOf(nodes));
//        Config config = new Config();
//        config.useSingleServer()
//                .setAddress("redis://"+"124.222.22.217"+":"+"16379")
//                .setPassword("L200107208017@./")
//                .setTimeout(5000);
//        return Redisson.create(config);
//    }

    //哨兵模式配置
//    @Value("${spring.redis.sentinel.master}")
//    String master;
//    @Value("#{'${spring.redis.sentinel.nodes}'.split(',')}")
//    private List<String> nodes;
//    @Value("${spring.redis.sentinel.fail-max}") private int failMax;
//    @Value("${spring.redis.pool.conn-timeout}") private int timeout;
//    @Value("${spring.redis.pool.size}")
//    int size;
//    @Value("${spring.redis.password}")
//    String password;
//    @Bean
//    RedissonClient redissonSentinel() {
//        Config config = new Config();
//        List<String> newNodes = new ArrayList<>(nodes.size());
//        nodes.forEach((index) -> newNodes.add(
//                index.startsWith("redis://") ? index : "redis://" + index));
//        SentinelServersConfig serverConfig = config.useSentinelServers()
//                .addSentinelAddress(newNodes.toArray(new String[0]))
//                .setMasterName(master)
//                .setReadMode(ReadMode.SLAVE)
////                .setTimeout(timeout)
////                .setMasterConnectionPoolSize(size)
////                .setSlaveConnectionPoolSize(size)
//                .setSentinelPassword(password)   // sentinel 密码
//                .setPassword(password);          // redis 密码
//        return Redisson.create(config);
//    }


    @Value("${spring.redis.password}")
    String password;
    @Value("#{'${spring.redis.cluster.nodes}'.split(',')}")
    private List<String> nodes;

    @Bean
    RedissonClient redissonSentinel() {
        Config config = new Config();
        List<String> newNodes = new ArrayList<>(nodes.size());
        nodes.forEach((index) -> newNodes.add(
                index.startsWith("redis://") ? index : "redis://" + index));
        config.useClusterServers()
                .setPassword(password)
                .addNodeAddress(newNodes.toArray(new String[0]));
        return Redisson.create(config);
    }

}

