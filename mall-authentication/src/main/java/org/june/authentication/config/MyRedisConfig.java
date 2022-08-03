package org.june.authentication.config;

import io.lettuce.core.ReadFrom;
import org.springframework.boot.autoconfigure.data.redis.LettuceClientConfigurationBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MyRedisConfig {
    @Bean
    public LettuceClientConfigurationBuilderCustomizer clientConfigurationBuilderCustomizer(){
        return clientConfigurationBuilder -> clientConfigurationBuilder.readFrom(
                ReadFrom.REPLICA_PREFERRED  //  优先读从库
        );
    }
}
