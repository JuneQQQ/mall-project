package org.june.ware.mqlistener;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.june.common.constant.OrderStatusEnum;
import org.june.common.constant.WareConstant;
import org.june.common.to.OrderTo;
import org.june.common.to.mq.StockDetailTo;
import org.june.common.to.mq.StockLockedTo;
import org.june.common.utils.R;
import org.june.ware.dao.WareSkuDao;
import org.june.ware.entity.WareOrderTaskDetailEntity;
import org.june.ware.entity.WareOrderTaskEntity;
import org.june.ware.feign.OrderFeignService;
import org.june.ware.service.WareOrderTaskDetailService;
import org.june.ware.service.WareOrderTaskService;
import org.june.ware.service.WareSkuService;
import org.june.ware.vo.OrderVo;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@Component
@Slf4j
@RabbitListener(queues = "stock.release.stock.queue")
public class StockReleaseListener {
    @Autowired
    WareOrderTaskDetailService wareOrderTaskDetailService;
    @Autowired
    WareOrderTaskService wareOrderTaskService;
    @Autowired
    OrderFeignService orderFeignService;
    @Autowired
    WareSkuDao wareSkuDao;
    @Autowired
    WareSkuService wareSkuService;

    /**
     * 解锁订单消息发来的解锁库存消息【正常逻辑】
     */
    @RabbitHandler
    @Transactional
    public void handleOrderCloseRelease(OrderTo to, Message message, Channel channel) {
        log.error("订单死信队列发来消息，尝试解锁订单！");
        // 查询订单状态
        WareOrderTaskEntity wareOrder = wareOrderTaskService.getOrderTaskByOrderSn(to.getOrderSn());
        Long id = wareOrder.getId();
        List<WareOrderTaskDetailEntity> list = wareOrderTaskDetailService.list(new QueryWrapper<WareOrderTaskDetailEntity>().
                eq("task_id", id).eq("lock_status", WareConstant.LockStatusEnum.LOCKED.getCode()));
        for (WareOrderTaskDetailEntity entity : list) {
            if (entity.getLockStatus() == WareConstant.LockStatusEnum.LOCKED.getCode()) {
                wareSkuService.unlockStock(entity.getSkuId(), entity.getWareId(),
                        entity.getSkuNum(), entity.getId());
            }
        }
        try {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 【补偿逻辑】
     */
    @RabbitHandler
    public void handleStockLockedRelease(StockLockedTo to, Message message, Channel channel) throws IOException {
        log.error("死信队列发来消息，尝试解锁库存！");
        try {
            StockDetailTo detail = to.getDetail();
            Long detailId = detail.getId();

            WareOrderTaskDetailEntity byId = wareOrderTaskDetailService.getById(detailId);
            // WareOrderTaskDetailEntity 不为空-说明库存已经扣减
            // 需要检查订单是否有效，否则回滚订单锁定的库存
            if (byId != null) {
                // 检查确认订单状态
                Long id = to.getId();
                WareOrderTaskEntity taskEntity = wareOrderTaskService.getById(id);
                String orderSn = taskEntity.getOrderSn();
                R r1 = orderFeignService.getOrderStatus(orderSn);
                if (r1.getCode() == 0) {
                    OrderVo data = r1.getData(new TypeReference<OrderVo>() {
                    });
                    // 订单已经【取消】或【不存在】，必须解锁库存
                    if (data == null || Objects.equals(data.getStatus(), OrderStatusEnum.CANCELED.getCode())) {
                        if (byId.getLockStatus() == WareConstant.LockStatusEnum.LOCKED.getCode()) {
                            // 锁定状态必须是1-锁定
                            wareSkuService.unlockStock(detail.getSkuId(), detail.getWareId(), detail.getSkuNum(), detailId);
                            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
                        }
                    }
                } else {
                    // 远程调用出问题，拒收消息，重新放回队列
                    channel.basicReject(message.getMessageProperties().getDeliveryTag(), true);
                }
            } else {
                // mq中有消息，但数据库中没有记录，可能是锁单有异常发生，数据库数据回滚，无需解锁
                channel.basicReject(message.getMessageProperties().getDeliveryTag(), false);
            }
            // 查不到库存工作单，无需解锁
        } catch (IOException e) {
            // 未知异常，消息重新入队
            e.printStackTrace();
            channel.basicReject(message.getMessageProperties().getDeliveryTag(), true);
        }
    }


}
