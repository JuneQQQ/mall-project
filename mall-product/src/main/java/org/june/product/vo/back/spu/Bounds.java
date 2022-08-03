/**
 * Copyright 2022 json.cn
 */
package org.june.product.vo.back.spu;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Bounds {

    private BigDecimal buyBounds;
    private BigDecimal growBounds;

}