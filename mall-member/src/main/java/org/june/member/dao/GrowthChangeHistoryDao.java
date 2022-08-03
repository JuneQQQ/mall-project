package org.june.member.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.member.entity.GrowthChangeHistoryEntity;

/**
 * 成长值变化历史记录
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:00:35
 */
@Mapper
public interface GrowthChangeHistoryDao extends BaseMapper<GrowthChangeHistoryEntity> {

}
