package org.june.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * Æ·ÅÆ·ÖÀà¹ØÁª
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-12 22:04:23
 */
@Data
@TableName("pms_category_brand_relation")
public class CategoryBrandRelationEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;
    private Long brandId;
    private Long catalogId;
    private String brandName;
    private String catalogName;

}
