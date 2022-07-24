package org.june.order;

import org.june.order.entity.OrderEntity;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.AmqpAdmin;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class OrderApplicationTests {

    @Autowired
    AmqpAdmin amqpAdmin;
    @Autowired
    RabbitTemplate rabbit;

    @Test
    void contextLoads() {
    }

    @Test
    void sendRabbit() {
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setId(1L);
        orderEntity.setOrderSn("dasds");
        orderEntity.setBillContent("dasgds");
        orderEntity.setBillHeader("dsadgkopjasds");
        rabbit.convertAndSend("order-event-exchange", "order.create.order", orderEntity);
    }

    @Test
    void testCreatExchange() {
        amqpAdmin.deleteExchange("test001");
        DirectExchange test001 = new DirectExchange("test001");
        amqpAdmin.declareExchange(test001);
    }

    @Test
    void testCreatQueue() {
        amqpAdmin.deleteExchange("test001.queue001");
        Queue queue1 = new Queue("test001.queue001", true, false, false);
        amqpAdmin.declareQueue(queue1);
    }

    @Test
    void testBinding() {
        Binding bind = new Binding("test001.queue001", Binding.DestinationType.QUEUE,
                "test001",
                "hello.java", null
        );
        amqpAdmin.declareBinding(bind);
    }

}
