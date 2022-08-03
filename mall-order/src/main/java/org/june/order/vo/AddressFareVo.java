package org.june.order.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AddressFareVo {
    private MemberAddressVo addressVo;
    private BigDecimal fare;
}
