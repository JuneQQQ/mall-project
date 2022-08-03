package org.june.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.coupon.dao.SeckillSessionDao;
import org.june.coupon.entity.SeckillSessionEntity;
import org.june.coupon.entity.SeckillSkuRelationEntity;
import org.june.coupon.service.SeckillSessionService;
import org.june.coupon.service.SeckillSkuRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service("seckillSessionService")
public class SeckillSessionServiceImpl extends ServiceImpl<SeckillSessionDao, SeckillSessionEntity> implements SeckillSessionService {
    @Autowired
    SeckillSkuRelationService seckillSkuRelationService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SeckillSessionEntity> page = this.page(
                new Query<SeckillSessionEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<SeckillSessionEntity> getLatestNDaySession(Integer days) {
        String d1 = startTimeMin();
        String d2 = endTimeMax(days);
        // 找出start_time从今天0:00到三天后0:00区间内的session（秒杀场次）
        List<SeckillSessionEntity> list = this.list(new QueryWrapper<SeckillSessionEntity>().
                between("start_time", d1, d2));
        if (CollectionUtils.isNotEmpty(list)) {
            return list.stream().peek(session -> {
                List<SeckillSkuRelationEntity> skuRelationEntityList = seckillSkuRelationService.list(new QueryWrapper<SeckillSkuRelationEntity>().
                        eq("promotion_session_id", session.getId()));
                session.setRelationSkus(skuRelationEntityList);
            }).collect(Collectors.toList());
        }
        return null;
    }

    private String startTimeMin() {
        LocalDate d1 = LocalDate.now();
        LocalDateTime of = LocalDateTime.of(d1, LocalTime.MIN);
        return of.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    private String endTimeMax(Integer days) {
        LocalDate d1 = LocalDate.now();
        LocalDate d2 = d1.plusDays(days);
        LocalDateTime of = LocalDateTime.of(d2, LocalTime.MAX);
        return of.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

}