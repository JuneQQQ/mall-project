package org.june.ware.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AddressFareVo {
    private MemberAddressVo addressVo;
    private BigDecimal fare;
}
