package com.geekbang.java.config;

import org.apache.shardingsphere.driver.api.yaml.YamlShardingSphereDataSourceFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@Configuration
public class DataSourceConfig {
    @Bean
    public DataSource shardingDataSource() throws IOException, SQLException {
        return YamlShardingSphereDataSourceFactory.createDataSource(new File("classpath:sharding.yml"));
    }
}
