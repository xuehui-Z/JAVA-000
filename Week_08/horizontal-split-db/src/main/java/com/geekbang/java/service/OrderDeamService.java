package com.geekbang.java.service;

import org.apache.shardingsphere.driver.api.yaml.YamlShardingSphereDataSourceFactory;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

public class OrderDeamService {

    private final DataSource dataSource;

    public OrderDeamService(final String yamlConfigFile) throws IOException, SQLException {
        dataSource = YamlShardingSphereDataSourceFactory.createDataSource(getFile(yamlConfigFile));
    }

    private File getFile(final String fileName) {
        return new File(OrderDeamService.class.getClassLoader().getResource(fileName).getFile());
    }

    public void insert() {
        String sql = "";
    }
}
