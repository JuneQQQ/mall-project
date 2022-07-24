package org.june.authentication.vo;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
public class UserRegisterVo {
    @NotEmpty(message = "用户名必须提交")
    @Size(min = 6,max = 18,message = "用户名长度必须在6-18位之间")
    private String username;

    public UserRegisterVo(String username, String password, String phone, String code) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.code = code;
    }

    @NotEmpty(message = "密码必须填写")
    @Size(min = 6,max = 18,message = "密码长度必须在6-18位之间")
    private String password;
    @Pattern(regexp = "^1[3-9]\\d{9}$",message = "手机号格式不正确")
    private String phone;
    @NotEmpty(message = "验证码不能为空")
    private String code;
}
