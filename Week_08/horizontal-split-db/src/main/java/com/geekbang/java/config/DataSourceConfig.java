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
        return YamlShardingSphereDataSourceFactory.createDataSource(getFile("sharding.yml"));
    }

    private File getFile(final String fileName) {
        return new File(DataSourceConfig.class.getClassLoader().getResource(fileName).getPath());
    }
}
