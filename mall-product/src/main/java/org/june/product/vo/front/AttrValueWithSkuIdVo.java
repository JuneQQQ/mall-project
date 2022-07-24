package org.june.product.vo.front;

import lombok.Data;

import java.io.Serializable;

@Data
public class AttrValueWithSkuIdVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String attrValue;
    private String skuIds;
}
