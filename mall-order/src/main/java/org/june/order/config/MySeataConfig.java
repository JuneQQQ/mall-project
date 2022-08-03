//package org.june.order.config;
//
//import com.zaxxer.hikari.HikariDataSource;
//import io.seata.rm.datasource.DataSourceProxy;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.mybatis.spring.SqlSessionFactoryBean;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.util.StringUtils;
//
//import javax.sql.DataSource;
//
//@Configuration
//public class MySeataConfig {
//    @Autowired
//    DataSourceProperties dataSourceProperties;
//
//    @Bean
//    public DataSource dataSource() {
//        HikariDataSource dataSource = dataSourceProperties.initializeDataSourceBuilder().type(HikariDataSource.class).build();
//        if (StringUtils.hasText(dataSourceProperties.getName())) {
//            dataSource.setPoolName(dataSourceProperties.getName());
//        }
//        return new DataSourceProxy(dataSource);
//    }
//
//}
