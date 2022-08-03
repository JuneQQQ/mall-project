/**
 * Copyright 2022 json.cn
 */
package org.june.product.vo.back.spu;

import lombok.Data;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;

@Data
@ToString
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
    private List<Attr> attr;
    private List<Images> images;
    private List<String> descar;
    private List<MemberPrice> memberPrice;

}