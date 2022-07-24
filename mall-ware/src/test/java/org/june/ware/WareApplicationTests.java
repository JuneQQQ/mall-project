package org.june.ware;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.june.common.to.mq.StockDetailTo;
import org.june.ware.entity.PurchaseEntity;
import org.june.ware.service.PurchaseService;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class WareApplicationTests {
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    RabbitTemplate rabbitTemplate;

    @Test
    void test1() {
        StockDetailTo stockDetailTo = new StockDetailTo();
        stockDetailTo.setId(1L);
        rabbitTemplate.convertAndSend("stock-event-exchange", "stock.lock.stock", stockDetailTo);
    }

    @Test
    void contextLoads() {
        List<PurchaseEntity> list = purchaseService.list(new QueryWrapper<>());
        System.out.println(list);
    }

}
