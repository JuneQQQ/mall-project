package org.june.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * sku销售属性&值
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 18:53:44
 */
@Data
@TableName("pms_sku_sale_attr_value")
public class SkuSaleAttrValueEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId
    private Long id;
    /**
     * sku_id
     */
    private Long skuId;
    /**
     * attr_id
     */
    private Long attrId;
    /**
     * 销售属性名
     */
    private String attrName;
    /**
     * 销售属性值
     */
    private String attrValue;
    /**
     * 顺序
     */
    private Integer attrSort;

}
