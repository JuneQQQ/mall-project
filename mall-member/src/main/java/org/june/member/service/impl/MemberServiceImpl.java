package org.june.member.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.member.dao.MemberDao;
import org.june.member.dao.MemberLevelDao;
import org.june.member.entity.MemberEntity;
import org.june.member.entity.MemberReceiveAddressEntity;
import org.june.member.exception.PhoneHasExistException;
import org.june.member.exception.UsernameHasExistException;
import org.june.member.service.MemberReceiveAddressService;
import org.june.member.service.MemberService;
import org.june.member.vo.MemberLoginVo;
import org.june.member.vo.MemberRegisterVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("memberService")
public class MemberServiceImpl extends ServiceImpl<MemberDao, MemberEntity> implements MemberService {
    @Autowired
    private MemberLevelDao memberLevelDao;
    @Autowired
    private MemberReceiveAddressService memberReceiveAddressService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MemberEntity> page = this.page(
                new Query<MemberEntity>().getPage(params),
                new QueryWrapper<MemberEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void register(MemberRegisterVo vo) {
        MemberEntity memberEntity = new MemberEntity();

        // 检查用户名和手机号是否唯一
        checkPhoneUnique(vo.getPhone());
        checkUsernameUnique(vo.getUsername());

        memberEntity.setPassword(new BCryptPasswordEncoder().encode(vo.getPassword()));
        memberEntity.setUsername(vo.getUsername());
        memberEntity.setMobile(vo.getPhone());
        // 设置默认等级
        memberEntity.setLevelId(memberLevelDao.getDefaultLevel().getId());

        // 添加默认地址，便于调试
        memberReceiveAddressService.save(new MemberReceiveAddressEntity(null, memberEntity.getId(), "default", "110", "123"
                , "上海市", "陆家嘴", "456", "滨江大道汤臣一品", "789", 1));
        baseMapper.insert(memberEntity);
    }

    public static void main(String[] args) {
        String encode = new BCryptPasswordEncoder().encode("123456");
        System.out.println(encode);
    }




    @Override
    public boolean checkUsernameUnique(String username) {
        if (baseMapper.selectCount(new QueryWrapper<MemberEntity>().eq("username", username)) > 0)
            throw new UsernameHasExistException();
        return true;
    }

    @Override
    public boolean checkPhoneUnique(String phone) {
        if (baseMapper.selectCount(new QueryWrapper<MemberEntity>().eq("mobile", phone)) > 0)
            throw new PhoneHasExistException();
        return true;
    }

    @Override
    public MemberEntity login(MemberLoginVo vo) {
        String username = vo.getUsername();
        String password = vo.getPassword();
        MemberEntity memberEntity = baseMapper.selectOne(new QueryWrapper<MemberEntity>().eq("username", username).
                or().eq("mobile", username));
        if (memberEntity != null &&
                // 密码验证
                new BCryptPasswordEncoder().matches(password, memberEntity.getPassword())) {
            // 登陆成功
            return memberEntity;
        } else {
            // 登陆失败
            return null;
        }

    }

    @Override
    public MemberEntity getOpenIdMember(String openid) {
        return baseMapper.selectOne(new QueryWrapper<MemberEntity>().eq("wx_open_id", openid));
    }

}