package org.june.member.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 会员收货地址
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:00:34
 */
@Data
@TableName("ums_member_receive_address")
public class MemberReceiveAddressEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public MemberReceiveAddressEntity(Long id, Long memberId, String name, String phone, String postCode, String province, String city, String region, String detailAddress, String areacode, Integer defaultStatus) {
        this.id = id;
        this.memberId = memberId;
        this.name = name;
        this.phone = phone;
        this.postCode = postCode;
        this.province = province;
        this.city = city;
        this.region = region;
        this.detailAddress = detailAddress;
        this.areacode = areacode;
        this.defaultStatus = defaultStatus;
    }

    @TableId
    private Long id;
    private Long memberId;
    private String name;
    private String phone;
    private String postCode;
    private String province;
    private String city;
    private String region;
    private String detailAddress;
    private String areacode;
    private Integer defaultStatus;
}
