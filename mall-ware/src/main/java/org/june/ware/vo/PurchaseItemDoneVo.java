package org.june.ware.vo;

import lombok.Data;

@Data
public class PurchaseItemDoneVo {
    private Long itemId;
    private Integer status;  //状态[0新建，1已分配，2正在采购，3已完成，4采购失败]
    private String reason;
}
