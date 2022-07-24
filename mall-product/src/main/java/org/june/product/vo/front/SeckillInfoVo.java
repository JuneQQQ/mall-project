package org.june.product.vo.front;

import lombok.Data;
import org.june.product.entity.SkuInfoEntity;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class SeckillInfoVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    /**
     * 活动id
     */
    private Long promotionId;
    /**
     * 活动场次id
     */
    private Long promotionSessionId;
    /**
     * 商品id
     */
    private Long skuId;
    /**
     * 随机码
     */
    private String randomCode;
    /**
     * 秒杀价格
     */
    private BigDecimal seckillPrice;
    /**
     * 秒杀总量
     */
    private int seckillCount;
    /**
     * 每人限购数量
     */
    private int seckillLimit;
    /**
     * 排序
     */
    private Integer seckillSort;

    private Long startTime;

    private Long endTime;

    //sku的详细信息
    private SkuInfoEntity skuInfoEntity;


}
