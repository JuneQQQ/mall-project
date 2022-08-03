package org.june.mall_third_party.component;

import lombok.Data;
import org.apache.http.HttpResponse;
import org.june.mall_third_party.utils.HttpUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Data
@Component
@ConfigurationProperties(prefix = "spring.cloud.alicloud.sms")
public class SmsComponent {
    private String host;
    private String path;
    private String template;
    private String sign;
    private String appcode;

    public HttpResponse sendSmsCode(String phone, String code) {
        String host = this.host;
        String path = this.path;
        String method = "POST";
        String appcode = this.appcode;
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("mobile", phone);
        querys.put("param", "**code**:" + code + ",**minute**:1");
        querys.put("smsSignId", this.sign);
        querys.put("templateId", this.template);
        Map<String, String> bodys = new HashMap<String, String>();

        try {
            return HttpUtils.doPost(host, path, method, headers, querys, bodys);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
