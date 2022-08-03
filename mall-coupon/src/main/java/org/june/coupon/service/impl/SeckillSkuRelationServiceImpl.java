package org.june.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.coupon.dao.SeckillSkuRelationDao;
import org.june.coupon.entity.SeckillSkuRelationEntity;
import org.june.coupon.service.SeckillSkuRelationService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("seckillSkuRelationService")
public class SeckillSkuRelationServiceImpl extends ServiceImpl<SeckillSkuRelationDao, SeckillSkuRelationEntity> implements SeckillSkuRelationService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<SeckillSkuRelationEntity> wrapper = new QueryWrapper<>();
        String promotionSessionId = (String) params.get("promotionSessionId");
        if (StringUtils.isNotEmpty(promotionSessionId)) {
            wrapper.eq("promotion_session_id", promotionSessionId);
        }
        IPage<SeckillSkuRelationEntity> page = this.page(
                new Query<SeckillSkuRelationEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

}