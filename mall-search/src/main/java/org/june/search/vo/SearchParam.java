package org.june.search.vo;

import lombok.Data;

import java.util.List;

@Data
public class SearchParam {
    private String keyword;
    private Long catalog3Id;
    private String sort;   // sort=saleCount_asc   price 排序条件

    private Integer hasStock;  // 是否只显示有货
    private String skuPrice;  // 价格区间查询
    private List<Long> brandIds; // 品牌ID
    private List<String> attrs; // 按照属性进行查询
    private Integer pageNum;

    private String _queryString;


}
