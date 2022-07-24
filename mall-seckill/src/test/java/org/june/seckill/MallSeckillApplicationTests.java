package org.june.seckill;

import org.june.seckill.service.SeckillService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@SpringBootTest
class MallSeckillApplicationTests {

    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    SeckillService seckillService;

    @Test
    void contextLoads() {
        List<String> s = new ArrayList<>();
        s.add("1");
        s.add("2");
        s.add("3");
        List<String> collect = s.stream().map(item -> {
            return item + "dasdas";
        }).collect(Collectors.toList());

        System.out.println(collect);
        System.out.println(s);
    }

    @Test
    void test1() {
        LocalDateTime now = LocalDateTime.now();
        System.out.println(now);
    }

}
