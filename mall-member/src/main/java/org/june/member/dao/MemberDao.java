package org.june.member.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.june.member.entity.MemberEntity;

/**
 * 会员
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:00:34
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {

}
