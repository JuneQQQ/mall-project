package org.june.product.vo.back;

import lombok.Data;

@Data
public class AttrResponseVo extends AttrVo {
    /**
     * catalogName
     * groupName
     */
    private String catalogName;
    private String groupName;

    private Long[] catalogPath;

}
