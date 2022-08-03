package org.june.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.hibernate.validator.constraints.URL;
import org.june.common.valid.AddGroup;
import org.june.common.valid.ListValue;
import org.june.common.valid.UpdateBrandStatus;
import org.june.common.valid.UpdateGroup;

import javax.validation.constraints.*;
import java.io.Serializable;


/**
 * 品牌
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
@Data
@TableName("pms_brand")
public class BrandEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 品牌id
     */
    @TableId
    @NotNull(message = "修改必须指定品牌id", groups = {UpdateGroup.class, UpdateBrandStatus.class})
    @Null(message = "新增不能指定id", groups = {AddGroup.class})
    private Long brandId;
    /**
     * 品牌名
     */

    @NotBlank(message = "品牌名必须提交", groups = {AddGroup.class, UpdateGroup.class})
    private String name;
    /**
     * 品牌logo地址
     */
    @NotBlank(groups = {AddGroup.class})
    @URL(message = "logo必须是一个合法的URL地址", groups = {AddGroup.class, UpdateGroup.class})
    private String logo;
    /**
     * 介绍
     */
    @NotBlank(groups = AddGroup.class)
    private String descript;
    /**
     * 显示状态[0-不显示；1-显示]
     */
//	@Range(min = 0,max = 1,message = "显示状态必须在0-1之间",groups = {AddGroup.class,UpdateGroup.class})
    @ListValue(values = {0, 1}, message = "显示状态是指定的值",
            groups = {AddGroup.class, UpdateGroup.class, UpdateBrandStatus.class})
    @NotNull(groups = UpdateBrandStatus.class, message = "显示状态是指定的值")
    private Integer showStatus;
    /**
     * 检索首字母
     */
    @NotBlank(groups = AddGroup.class)
    @Pattern(regexp = "^[a-zA-Z]$", message = "检索首字母必须有且只有一个字母", groups = {AddGroup.class, UpdateGroup.class})
    private String firstLetter;
    /**
     * 排序
     */
    @Min(value = 0, message = "排序字段必须大于等于0", groups = {AddGroup.class, UpdateGroup.class})
    private Integer sort;

}
