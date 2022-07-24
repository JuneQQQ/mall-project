package org.june.member.vo;

import lombok.Data;

@Data
public class WxUserLoginVo {
    private Long id;
    private String wxOpenId;
    private String nickname;
    private String header;
}
