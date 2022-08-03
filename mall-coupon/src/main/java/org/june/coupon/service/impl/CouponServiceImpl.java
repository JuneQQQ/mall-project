package org.june.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.coupon.dao.CouponDao;
import org.june.coupon.entity.CouponEntity;
import org.june.coupon.service.CouponService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("couponService")
public class CouponServiceImpl extends ServiceImpl<CouponDao, CouponEntity> implements CouponService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CouponEntity> page = this.page(
                new Query<CouponEntity>().getPage(params),
                new QueryWrapper<CouponEntity>()
        );

        return new PageUtils(page);
    }

}