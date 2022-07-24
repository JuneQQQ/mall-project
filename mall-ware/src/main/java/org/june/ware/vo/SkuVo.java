/**
 * Copyright 2022 json.cn
 */
package org.june.ware.vo;

import lombok.Data;
import org.june.common.to.MemberPrice;

import java.math.BigDecimal;
import java.util.List;

@Data
public class SkuVo {
    private Long skuId;
    private String skuName;
    private String price;
    private String skuTitle;
    private String skuSubtitle;
    private int fullCount;
    private BigDecimal discount;
    private int countStatus;
    private BigDecimal fullPrice;
    private BigDecimal reducePrice;
    private int priceStatus;
    private List<String> descar;
    private List<MemberPrice> memberPrice;

}