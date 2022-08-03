package org.june.product.vo.front;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
@ToString
public class SpuGroupBaseAttrVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String groupName;
    private List<SpuBaseAttrVo> baseAttrVos;
}
