package org.june.ware.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.ware.entity.PurchaseEntity;

/**
 * 采购信息
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
@Mapper
public interface PurchaseDao extends BaseMapper<PurchaseEntity> {

}
