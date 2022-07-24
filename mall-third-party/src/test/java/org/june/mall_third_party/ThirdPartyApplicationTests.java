package org.june.mall_third_party;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpResponse;
import org.june.mall_third_party.component.SmsComponent;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

@SpringBootTest
@Slf4j
class ThirdPartyApplicationTests {
    @Autowired
    OSS ossClient;

    @Value("${spring.cloud.alicloud.oss.endpoint}")
    private String endpoint;
    @Value("${spring.cloud.alicloud.access-key}")
    private String accessId;
    @Value("${spring.cloud.alicloud.secret-key}")
    private String accessKey;
    @Value("${spring.cloud.alicloud.bucket}")
    private String bucket;

    @Autowired
    private SmsComponent smsComponent;

    @Test
    void contextLoads() {
        HttpResponse httpResponse = smsComponent.sendSmsCode("17513324841", "222");
    }

    @Test
    void testOss() throws FileNotFoundException {
        log.info("测试用例：上传application.yml文件到oss");
        ossClient.putObject("mall-project-february", "application.yml",
                new FileInputStream("/Users/june/IdeaProjects/mall-project/mall-third-party/src/main/resources/application.yml"));
        ossClient.shutdown();
        log.info("over!");
    }

}
