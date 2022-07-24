package org.june.ware.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.common.utils.R;
import org.june.ware.dao.WareInfoDao;
import org.june.ware.entity.WareInfoEntity;
import org.june.ware.feign.MemberFeignService;
import org.june.ware.service.WareInfoService;
import org.june.ware.vo.AddressFareVo;
import org.june.ware.vo.MemberAddressVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Map;


@Service("wareInfoService")
public class WareInfoServiceImpl extends ServiceImpl<WareInfoDao, WareInfoEntity> implements WareInfoService {

    @Autowired
    private MemberFeignService memberFeignService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<WareInfoEntity> page = this.page(
                new Query<WareInfoEntity>().getPage(params),
                new QueryWrapper<WareInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {
        QueryWrapper<WareInfoEntity> wrapper = new QueryWrapper<>();
        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            wrapper.and(i -> i.eq("id", key).
                    or().like("name", key).
                    or().like("address", key).
                    or().like("areacode", key));
        }

        IPage<WareInfoEntity> page = this.page(
                new Query<WareInfoEntity>().getPage(params),
                wrapper
        );
        return new PageUtils(page);
    }

    @Override
    public AddressFareVo getFare(Long addrId) {
        // TODO 运费计算逻辑
        R info = memberFeignService.info(addrId);
        AddressFareVo addressFareVo = new AddressFareVo();
        if (info.getCode() == 0) {
            MemberAddressVo data = info.getData("memberReceiveAddress", new TypeReference<MemberAddressVo>() {
            });
            String phone = data.getPhone();
            String substring = phone.substring(phone.length() - 1);
            addressFareVo.setFare(new BigDecimal(substring));
            addressFareVo.setAddressVo(data);
        }
        return addressFareVo;
    }

}