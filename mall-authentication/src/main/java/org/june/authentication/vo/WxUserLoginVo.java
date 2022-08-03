package org.june.authentication.vo;

import lombok.Data;

@Data
public class WxUserLoginVo {
    private String id;
    private String wxOpenId;
    private String nickname;
    private String header;
}
