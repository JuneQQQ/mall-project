package org.june.seckill;

import org.june.seckill.service.SeckillService;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@SpringBootTest
class MallSeckillApplicationTests {

    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    SeckillService seckillService;

    @Autowired
    RabbitTemplate rabbitTemplate;

    @Test
    void testRabbitMQPriority() {
        String message = "test:";
        for (int i = 1; i <= 10; i++) {
            CorrelationData data = new CorrelationData(i + "");
            int finalI = i;
            rabbitTemplate.convertAndSend("", "test001", message + i, msg -> {
                MessageProperties properties = msg.getMessageProperties();
                properties.setExpiration("20000");
                properties.setDeliveryMode(MessageProperties.DEFAULT_DELIVERY_MODE);
                properties.setPriority(finalI);
                return msg;
            }, data);
        }
    }

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
