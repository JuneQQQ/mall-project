package org.june.coupon;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import org.june.coupon.entity.SeckillSessionEntity;
import org.june.coupon.entity.SeckillSkuRelationEntity;
import org.june.coupon.service.SeckillSessionService;
import org.june.coupon.service.SeckillSkuRelationService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@SpringBootTest
class CouponApplicationTests {
    @Autowired
    SeckillSkuRelationService seckillSkuRelationService;
    @Autowired
    private SeckillSessionService seckillSessionService;

    @Test
    void testS() {
        String format = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        List<SeckillSessionEntity> list = seckillSessionService.list(new QueryWrapper<SeckillSessionEntity>().
                gt("start_time", format).lt("end_time", format));
//                between("start_time", d1, d2));
        if (CollectionUtils.isNotEmpty(list)) {
            List<SeckillSessionEntity> promotion_session_id1 = list.stream().peek(session -> {
                List<SeckillSkuRelationEntity> promotion_session_id = seckillSkuRelationService.list(new QueryWrapper<SeckillSkuRelationEntity>().
                        eq("promotion_session_id", session.getId()));
                session.setRelationSkus(promotion_session_id);
            }).collect(Collectors.toList());

            System.out.println(promotion_session_id1);
        }
    }

    @Test
    void contextLoads() {
        List<SeckillSessionEntity> latestNDaySession =
                seckillSessionService.getLatestNDaySession(3);
        System.out.println(latestNDaySession.toString());

    }

}
