package org.june.ware.vo;

import lombok.Data;

@Data
public class LockStockResult {
    private Long skuId;
    private Integer lockNum;
    private Boolean locked;
}
