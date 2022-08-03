package org.june.order.config;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import lombok.Data;
import org.june.order.vo.PayVo;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "alipay")
@Component
@Data
public class AlipayTemplate {

    //在支付宝创建的应用的id
    private String app_id = "2021000117663691";

    // 商户私钥，您的PKCS8格式RSA2私钥
    private String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCqLZbIcJkRAICaakn+nOgqW9lK4LjFztNpVshME/iwrfF7QdaXYEiMcf5hW+5NX5mhPfx8m7kAkTkjbH+g3v7P3ue9tUvZMTZ7lbm70havvcmtMopxSHzCT2Ez77iqtBYgbgL8STgGB5Sa3/JenpCvoYv/z30kqirCEKR4OrxlxeUpAhMoz7CWVbx3KOyyMhzF2DGVPs+9dkF3Z6sTy4bz0x1cRNWdPHiOArQb7/klMsXQFh7hWWM7bW170/KwmzX8/io94my9P/J82ilCgaSZPHkUz2RRnFMJzkoOclVUdBuDsSJHK/j2Ghq4cRSDf7VCt6OK0JR1P6oypB9NSMM7AgMBAAECggEAdr2YmAL4yoQvN48yUhXpaKTt2PEz+9F0ceu7llnZDG5SME6gDL+B330qoYQjopkx+O/nXIrLaznpRG5QH095PFGsIRJ++ez8tv6hugu9CKLENbUuJB0P8ASzLin2ECXXyoj4TFBKZuqjJe1cj+jTy7hMlxGPoCWb8AzstXdGPTvUXR0PhhcHeEOqIGW3dnSoCVEIoBY0gFhWZWUHJInE70A03Y3rDSrGOBjrUc1i3Midu+aKiT8Wy1hql/hCr6zdTLERNf8kqG5z8Gt4kck7eZlTekTPutCOhcEJl8xGgELQfju3qTzU7utFlorgQ8Fs4eevtxhkWuhlCAz47eSGAQKBgQDXhFbw68xGhQlRCxObWlru+T8FR2sF4BJP8a/yy/V2fRF5Rp28jy3+kM4bqC5MCbhmcBFJSHokqkLtobRonezYrLH5Jaskx8XnpE4hbUyDTdsrbMxwjYQGiiQvi+x/ya8YYFyKdpLBcdesp9AElycTGdaO5BVDhCKivGSBk51g0wKBgQDKJQTQtYrF4kzDt/Pc62OjVJvwX5G/WRvMoYLNL+pBOxJpsggln2av5WJCOQmTynCM2loSayLIRakIcutCMN6pTsi1zWufKSScI8qudEeCBIA48dzqz48FQLJwALLPM6cARAu8sPQ7wBfbg16mgNlYsOpMMYZQebsJVyfIv8ZS+QKBgFnzITpSoCK6ueW6YsePUa62FqiEY1XDbMEzFYWXvO5kStu8Lm+Zrs+17mA6tIAF+pG+qmhUuK3+5go6WIrlhwn0Ih/jqeei/aWtvPJUpP+Uiio4sac0WWtFUs8Jbn7zVYIuDdG4pY3ZjvO/4qFX2PYu7Y8cAQf56V7UlHpEewYDAoGBAK5+HhX7X/tJSXJ5TCyblLrcwm9QUAOY7AJMORjeD5yXXWGXqKixXHbhz1vS2I2W5mjv42iayr+OQkdky+erP8lulJs643fUkCGoU8Eb5s45DGYbgdO/r3mdS2qbb76km7gDBQ6wwWMCgpWeZQndl8CTluyGo6a8LdP2RAVqZcwhAoGAZ9VEEm96fav8zGjJnDojDCyH4ZxricOVYAPlXKg+pK7FVk2tKsOoxm+PRpIUfggs3aSqfH98YxyJsSHYWdxSnpcW5Mw4v54CXQ7kTYtF8gwXYbZYYtpxzq3JLkKHHfIX6uoYGYHY/HvlycdpWcIGINS0+6Oaedc1YR3n3clUo+k=";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    private String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAikCIiCaZwmfdkwGpvzuCpg6/JKjAYHCLNGzckpiyuEMJT6DRXPoXCetSCaII+fITT+unJRyMZULT+OuRb9BEhlYpmAm6IdbkJ0a1LWkiKRRNzxqnKc2CMRwaAIfSIZ08hna1L/Lq3Lb3l6OFOIL43Xi7/KJV+ppGLgBQUFVFlyP27yXvUkRFTRfSj4yxse1i3JIYHkeQb/W7yyZmuutRXQ7JddD/+zrrcqg736mbtSB9JIEsKf9jMXe63ulHE6m9gS3FGWU8wHdzvxp6LofoB3g3/SL+g3yA8Ecdop7aJxaVzG53gDGk+RFG04Om8j1VdDF1Y5glaGi9kydbTP52FQIDAQAB";
    // 服务器[异步通知]页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // 支付宝会悄悄的给我们发送一个请求，告诉我们支付成功的信息
    private String notify_url;  // 见配置文件

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //同步通知，支付成功，一般跳转到成功页
    private String return_url; // 见配置文件

    // 签名方式
    private String sign_type = "RSA2";

    // 字符编码格式
    private String charset = "utf-8";

    private String timeout = "30m";

    // 支付宝网关； https://openapi.alipaydev.com/gateway.do
    private String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    public String pay(PayVo vo) throws AlipayApiException {
        //AlipayClient alipayClient = new DefaultAlipayClient(AlipayTemplate.gatewayUrl, AlipayTemplate.app_id, AlipayTemplate.merchant_private_key, "json", AlipayTemplate.charset, AlipayTemplate.alipay_public_key, AlipayTemplate.sign_type);
        //1、根据支付宝的配置生成一个支付客户端
        AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl,
                app_id, merchant_private_key, "json",
                charset, alipay_public_key, sign_type);

        //2、创建一个支付请求 //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(return_url);
        alipayRequest.setNotifyUrl(notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = vo.getOut_trade_no();
        //付款金额，必填
        String total_amount = vo.getTotal_amount();
        //订单名称，必填
        String subject = vo.getSubject();
        //商品描述，可空
        String body = vo.getBody();

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"" + timeout + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String result = alipayClient.pageExecute(alipayRequest).getBody();

        //会收到支付宝的响应，响应的是一个页面，只要浏览器显示这个页面，就会自动来到支付宝的收银台页面
//        System.out.println("支付宝的响应："+result);

        return result;

    }
}
