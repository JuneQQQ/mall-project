package org.june.product.vo.front;

import lombok.Data;

import java.io.Serializable;

@Data
public class SpuBaseAttrVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String attrName;
    private String attrValue;
}
