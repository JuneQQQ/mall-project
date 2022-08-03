package org.june.member.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.member.entity.MemberEntity;
import org.june.member.vo.MemberLoginVo;
import org.june.member.vo.MemberRegisterVo;

import java.util.Map;

/**
 * 会员
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:00:34
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void register(MemberRegisterVo vo);

    boolean checkUsernameUnique(String username);

    boolean checkPhoneUnique(String phone);

    MemberEntity login(MemberLoginVo vo);

    MemberEntity getOpenIdMember(String openid);
}

