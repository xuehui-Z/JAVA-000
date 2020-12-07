package com.geekbang.java.service.init;

import lombok.SneakyThrows;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.InstantiationAwareBeanPostProcessor;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.lang.NonNull;
import org.springframework.util.StringUtils;

import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @Description:
 *
 * @author: xuehui
 * @createDate: 2020/12/7 23:37
 */
public class LocalDataSourceLoader implements InstantiationAwareBeanPostProcessor {

    private static final Logger LOGGER = LoggerFactory.getLogger(LocalDataSourceLoader.class);
    private static final String SCHEMA_SQL_DS0_FILE = "META-INF/schema_ds0.sql";
    private static final String SCHEMA_SQL_DS1_FILE = "META-INF/schema_ds1.sql";

    @Override
    public Object postProcessAfterInitialization(@NonNull final Object bean, final String beanName) throws BeansException {
        if (bean instanceof DataSourceProperties) {
            this.init((DataSourceProperties) bean);
        }
        return bean;
    }

    @SneakyThrows
    private void init(DataSourceProperties properties) {
        // 暂时写死URL
        String jdbcUrl = "jdbc:mysql://localhost:3306";
        Connection connection = DriverManager.getConnection(jdbcUrl, properties.getUsername(), properties.getPassword());
        this.execute(connection);
    }

    private void execute(Connection conn) throws Exception {
        ScriptRunner runner = new ScriptRunner(conn);
        // doesn't print logger
        // runner.setLogWriter(null);
        Resources.setCharset(StandardCharsets.UTF_8);
        Reader read = Resources.getResourceAsReader(SCHEMA_SQL_DS0_FILE);
        LOGGER.info("execute soul schema sql: {}", SCHEMA_SQL_DS0_FILE);
        runner.runScript(read);
        read = Resources.getResourceAsReader(SCHEMA_SQL_DS1_FILE);
        LOGGER.info("execute soul schema sql: {}", SCHEMA_SQL_DS1_FILE);
        runner.runScript(read);
        runner.closeConnection();
        conn.close();
    }

}
