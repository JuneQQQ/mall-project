package org.june.product.vo.front;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
@ToString
public class SkuItemSaleAttrsVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long attrId;
    private String attrName;

    private List<AttrValueWithSkuIdVo> attrValues;
}
