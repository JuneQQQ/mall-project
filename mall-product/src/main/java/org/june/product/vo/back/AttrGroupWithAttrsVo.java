package org.june.product.vo.back;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import org.june.product.entity.AttrEntity;

import java.io.Serializable;
import java.util.List;

@Data
public class AttrGroupWithAttrsVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 分组id
     */
    private Long attrGroupId;
    /**
     * 组名
     */
    private String attrGroupName;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 描述
     */
    private String descript;
    /**
     * 组图标
     */
    private String icon;
    /**
     * 所属分类id
     */
    private Long catalogId;

    @TableField(exist = false)
    private List<AttrEntity> attrs;

}
