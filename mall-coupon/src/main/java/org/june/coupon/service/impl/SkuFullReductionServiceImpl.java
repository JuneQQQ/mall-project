package org.june.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.to.MemberPrice;
import org.june.common.to.SkuReductionTo;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.coupon.dao.SkuFullReductionDao;
import org.june.coupon.entity.MemberPriceEntity;
import org.june.coupon.entity.SkuFullReductionEntity;
import org.june.coupon.entity.SkuLadderEntity;
import org.june.coupon.service.MemberPriceService;
import org.june.coupon.service.SkuFullReductionService;
import org.june.coupon.service.SkuLadderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service("skuFullReductionService")
public class SkuFullReductionServiceImpl extends ServiceImpl<SkuFullReductionDao, SkuFullReductionEntity> implements SkuFullReductionService {
    @Autowired
    private SkuLadderService skuLadderService;
    @Autowired
    private MemberPriceService memberPriceService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuFullReductionEntity> page = this.page(
                new Query<SkuFullReductionEntity>().getPage(params),
                new QueryWrapper<SkuFullReductionEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void saveReduction(SkuReductionTo skuReductionTo) {
        //1. sms_sku_ladder
        // 折扣必须>0
        if (skuReductionTo.getDiscount().compareTo(BigDecimal.ZERO) > 0) {
            SkuLadderEntity skuLadderEntity = new SkuLadderEntity();
            skuLadderEntity.setSkuId(skuReductionTo.getSkuId());
            skuLadderEntity.setFullCount(skuReductionTo.getFullCount());
            skuLadderEntity.setDiscount(skuReductionTo.getDiscount());
            skuLadderEntity.setAddOther(skuReductionTo.getCountStatus());
            skuLadderService.save(skuLadderEntity);
        }


        //2.sms_sku_full_reduction
        // 满减值必须小于商品价格
        if (skuReductionTo.getFullPrice().compareTo(skuReductionTo.getReducePrice()) > 0) {
            System.out.println(skuReductionTo.getFullPrice());
            SkuFullReductionEntity skuFullReductionEntity = new SkuFullReductionEntity();
            BeanUtils.copyProperties(skuReductionTo, skuFullReductionEntity);
            skuFullReductionEntity.setAddOther(skuReductionTo.getCountStatus());
            this.save(skuFullReductionEntity);
        }


        //3.sms_member_price
        List<MemberPrice> memberPriceList = skuReductionTo.getMemberPrice();
        List<MemberPriceEntity> collect = memberPriceList.stream().filter(item -> {
            // 会员对应价格不能为空并且>=0
            System.out.println(item.getPrice());
            return item.getPrice() != null && item.getPrice().compareTo(BigDecimal.ZERO) >= 0;
        }).map(item -> {
            MemberPriceEntity memberPriceEntity = new MemberPriceEntity();
            memberPriceEntity.setSkuId(skuReductionTo.getSkuId());
            memberPriceEntity.setMemberLevelId(item.getId());
            memberPriceEntity.setMemberLevelName(item.getName());
            memberPriceEntity.setAddOther(1);
            return memberPriceEntity;
        }).collect(Collectors.toList());
        memberPriceService.saveBatch(collect);
    }

}