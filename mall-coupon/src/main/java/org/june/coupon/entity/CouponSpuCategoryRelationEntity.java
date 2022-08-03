package org.june.coupon.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 优惠券分类关联
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 19:55:02
 */
@Data
@TableName("sms_coupon_spu_category_relation")
public class CouponSpuCategoryRelationEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId
    private Long id;
    /**
     * 优惠券id
     */
    private Long couponId;
    /**
     * 产品分类id
     */
    private Long categoryId;
    /**
     * 产品分类名称
     */
    private String categoryName;

}
