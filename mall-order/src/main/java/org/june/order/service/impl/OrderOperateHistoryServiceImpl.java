package org.june.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.order.dao.OrderOperateHistoryDao;
import org.june.order.entity.OrderOperateHistoryEntity;
import org.june.order.service.OrderOperateHistoryService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("orderOperateHistoryService")
public class OrderOperateHistoryServiceImpl extends ServiceImpl<OrderOperateHistoryDao, OrderOperateHistoryEntity> implements OrderOperateHistoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderOperateHistoryEntity> page = this.page(
                new Query<OrderOperateHistoryEntity>().getPage(params),
                new QueryWrapper<OrderOperateHistoryEntity>()
        );

        return new PageUtils(page);
    }

}