package org.june.order.mqlistener;

import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.june.common.to.QuickOrderTo;
import org.june.order.entity.OrderEntity;
import org.june.order.service.OrderService;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@Slf4j
public class OrderListener {
    @Autowired
    OrderService orderService;

    /**
     *  订单超时，解锁订单，这条消息逻辑上应早于解锁库存消息，但是由于有以外情况发生，所以方法内又发了一次解锁库存
     */
    @RabbitListener(queues = "order.release.order.queue")
    public void releaseOrder(OrderEntity o, Channel channel, Message message) throws IOException {
        try {
            orderService.closeOrder(o);
            // 手动调用支付宝收单，防止用户再去支付 TODO
            //https://opendocs.alipay.com/apis/api_1/alipay.trade.close
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (Exception e) {
            e.printStackTrace();
            channel.basicReject(message.getMessageProperties().getDeliveryTag(), true);
        }
    }


    /**
     * 监听已经秒杀成功的订单，削峰创建订单
     */
    @RabbitListener(queues = "order.seckill.order.queue")
    public void seckillOrder(QuickOrderTo to, Channel channel, Message message) throws IOException {
        try {
            log.info("创建秒杀订单！");
            orderService.createSeckillOrder(to);
            // 手动调用支付宝收单，防止用户再去支付 TODO
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (Exception e) {
            e.printStackTrace();
            channel.basicReject(message.getMessageProperties().getDeliveryTag(), true);
        }

    }


}
