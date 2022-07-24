package org.june.ware.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 库存工作单
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
@Data
@TableName("wms_ware_order_task_detail")
@NoArgsConstructor
@AllArgsConstructor
public class WareOrderTaskDetailEntity implements Serializable {
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
     * sku_name
     */
    private String skuName;
    /**
     * 购买个数
     */
    private Integer skuNum;
    /**
     * 工作单id
     */
    private Long taskId;

    private Long wareId;
    private Integer lockStatus; //1锁定 2解锁 3扣减

}
