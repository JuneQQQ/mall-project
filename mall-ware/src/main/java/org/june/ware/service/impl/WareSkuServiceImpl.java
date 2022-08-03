package org.june.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.Data;
import org.apache.commons.lang.StringUtils;
import org.june.common.exception.NoStockException;
import org.june.common.to.mq.StockDetailTo;
import org.june.common.to.mq.StockLockedTo;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.common.utils.R;
import org.june.ware.dao.WareSkuDao;
import org.june.ware.entity.PurchaseDetailEntity;
import org.june.ware.entity.WareOrderTaskDetailEntity;
import org.june.ware.entity.WareOrderTaskEntity;
import org.june.ware.entity.WareSkuEntity;
import org.june.ware.feign.OrderFeignService;
import org.june.ware.feign.ProductService;
import org.june.ware.service.WareOrderTaskDetailService;
import org.june.ware.service.WareOrderTaskService;
import org.june.ware.service.WareSkuService;
import org.june.ware.vo.OrderItemVo;
import org.june.ware.vo.SkuVo;
import org.june.ware.vo.WareSkuLockVo;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service("wareSkuService")
public class WareSkuServiceImpl extends ServiceImpl<WareSkuDao, WareSkuEntity> implements WareSkuService {
    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    private WareSkuDao wareSkuDao;
    @Autowired
    private ProductService productService;
    @Autowired
    private WareOrderTaskService wareOrderTaskService;
    @Autowired
    private WareOrderTaskDetailService wareOrderTaskDetailService;
    @Autowired
    private OrderFeignService orderFeignService;

    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {
        QueryWrapper<WareSkuEntity> wrapper = new QueryWrapper<>();

        String skuId = (String) params.get("skuId");
        if (StringUtils.isNotEmpty(skuId)) {
            wrapper.eq("sku_id", skuId);
        }
        String wareId = (String) params.get("wareId");
        if (StringUtils.isNotEmpty(wareId)) {
            wrapper.eq("ware_id", wareId);
        }

        IPage<WareSkuEntity> page = this.page(
                new Query<WareSkuEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    /**
     * 根据采购单添加库存
     *
     * @param byId 采购需求id
     */
    @Override
    public void addStock(PurchaseDetailEntity byId) {
        if (byId == null) {
            return;
        }
        List<WareSkuEntity> wareSkuEntities = wareSkuDao.selectList(new QueryWrapper<WareSkuEntity>().
                eq("sku_id", byId.getSkuId()).eq("ware_id", byId.getWareId()));
        if (CollectionUtils.isEmpty(wareSkuEntities)) {
            // 如果还没有这个库存记录则新增
            WareSkuEntity wareSkuEntity = new WareSkuEntity();
            wareSkuEntity.setSkuId(byId.getSkuId());
            wareSkuEntity.setStock(byId.getSkuNum());
            wareSkuEntity.setWareId(byId.getWareId());
            wareSkuEntity.setStockLocked(0);
            // 获取商品名称,失败不回滚
            try {
                R info = productService.info(byId.getSkuId());
                Map<String, Object> data = (Map<String, Object>) info.get("skuInfo");
                if (info.getCode() == 0) {
                    wareSkuEntity.setSkuName((String) data.get("skuName"));
                } else {
                    log.error("远程调用product服务查询sku详情失败，失败信息：" + info.getMsg());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            wareSkuDao.insert(wareSkuEntity);
        }
        // 已有库存记录则新增
        wareSkuDao.updateStock(byId.getSkuId(), byId.getWareId(), byId.getSkuNum());
    }

    /**
     * 查询给定sku是否有库存
     *
     * @param skuIds skuids
     * @return map<id, bool>
     */
    @Override
    public Map<Long, Boolean> getSkuHasStock(List<Long> skuIds) {
        HashMap<Long, Boolean> map = new HashMap<>();
        for (Long skuId : skuIds) {
            Long count = baseMapper.getSkuStock(skuId);
            if (count == null) count = 0L;
            map.put(skuId, count > 0);
        }
        return map;
    }


    /**
     * 根据给定的商品查询是否有库存
     * 任意一个商品没有库存则抛出异常，数据库数据回滚
     * 成功锁一个商品，就发送一次mq锁库存消息
     * stock.lock.stock ——> stock.delay.queue
     */
    @Override
    @Transactional(rollbackFor = NoStockException.class)
    public boolean lockStock(WareSkuLockVo vo) {
        // 保存库存工作单 WareOrderTaskEntity
        WareOrderTaskEntity wareOrderTaskEntity = new WareOrderTaskEntity();
        wareOrderTaskEntity.setOrderSn(vo.getOrderSn());
        wareOrderTaskService.save(wareOrderTaskEntity);

        List<OrderItemVo> locks = vo.getLocks();
        List<SkuWareHasStock> collect = locks.stream().map(item -> {
            SkuWareHasStock stock = new SkuWareHasStock();
            Long skuId = item.getSkuId();
            stock.setSkuId(skuId);
            // 查询并设置有库存的仓库id
            stock.setWareId(wareSkuDao.listWareIdHasSkuStock(skuId));
            stock.setNum(item.getCount());
            return stock;
        }).collect(Collectors.toList());

        // 如果所有个商品都锁定成功，将当前商品锁定了几件的工作单记录发给MQ
        // 有商品锁定失败，前面保存的工作单信息就回滚了
        // 发送出去的消息，即使想要解锁记录，由于去数据库查不到id，所以就不用解锁
        for (SkuWareHasStock s : collect) {
            boolean skuStocked = false;
            Long skuId = s.getSkuId();
            Integer num = s.getNum();
            List<Long> wareIds = s.getWareId();

            if (CollectionUtils.isNotEmpty(wareIds)) {
                for (Long wareId : wareIds) {
                    // 当前遍历的仓库尝试锁单
                    Long success = wareSkuDao.lockSkuStock(skuId, wareId, num);
                    if (success == 1) {
                        skuStocked = true; // 标记该商品有库存
                        WareOrderTaskDetailEntity detail =
                                new WareOrderTaskDetailEntity(null, skuId, "", s.getNum(),
                                        wareOrderTaskEntity.getId(), wareId, 1);
                        wareOrderTaskDetailService.save(detail);

                        StockLockedTo stockLockedTo = new StockLockedTo();
                        stockLockedTo.setId(wareOrderTaskEntity.getId());
                        StockDetailTo stockDetailTo = new StockDetailTo();
                        BeanUtils.copyProperties(detail, stockDetailTo);
                        stockLockedTo.setDetail(stockDetailTo);
                        // 锁单成功，添加锁单死信队列消息
                        // 中间的订单库存不足，整个 WareOrderTaskDetailService 回滚，数据库中没有这次保存的所有订单项记录
                        rabbitTemplate.convertAndSend("stock-event-exchange",
                                "stock.lock.stock", stockLockedTo);
                        break;
                    }
                    // 失败，重试下一个仓库
                }
                if (!skuStocked) {
                    // 这个商品没有库存 - 报异常
                    throw new NoStockException(skuId);
                }
            } else {
                throw new NoStockException(skuId);
            }
        }
        return true;
    }

    /**
     * 回滚数据库的-库存数据
     */
    @Override
    public void unlockStock(Long skuId, Long wareId, Integer num, Long taskDetailId) {
        wareSkuDao.unlockStock(skuId, wareId, num);

        WareOrderTaskDetailEntity e = new WareOrderTaskDetailEntity();
        e.setId(taskDetailId);
        e.setLockStatus(2); // 1锁定 2解锁 3正常扣减
        wareOrderTaskDetailService.updateById(e);
    }

    /**
     * 为指定的商品添加100个默认库存
     */
    @Override
    public void addDefaultStock(List<SkuVo> skus) {
        List<WareSkuEntity> collect = skus.stream().map(sku -> {
            WareSkuEntity wareSkuEntity = new WareSkuEntity();
            wareSkuEntity.setSkuId(sku.getSkuId());
            wareSkuEntity.setWareId(1L);
            wareSkuEntity.setSkuName(sku.getSkuName());
            wareSkuEntity.setStock(100);
            wareSkuEntity.setStockLocked(0);
            return wareSkuEntity;
        }).collect(Collectors.toList());
        this.saveBatch(collect);
    }

    @Data
    private static class SkuWareHasStock {
        private Long skuId; // 商品id
        private List<Long> wareId; // 仓库id
        private Integer num; //锁件数
    }


}