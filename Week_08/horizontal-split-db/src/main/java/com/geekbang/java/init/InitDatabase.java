package com.geekbang.java.init;

import lombok.SneakyThrows;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.InstantiationAwareBeanPostProcessor;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.lang.NonNull;

import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Map;

/**
 * @Description:
 *
 * @author: xuehui
 * @createDate: 2020/12/7 23:37
 */
public class InitDatabase{
    private static final Logger LOGGER = LoggerFactory.getLogger(InitDatabase.class);
    private static final String SCHEMA_SQL_FILE = "META-INF/schema.sql";

    @SneakyThrows
    public static void init() {
        // 暂时写死URL
        String jdbcUrl = "jdbc:mysql://localhost:3306?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true";
        Connection connection = DriverManager.getConnection(jdbcUrl, "root", "");
        execute(connection);
    }

    private static void execute(Connection conn) throws Exception {
        ScriptRunner runner = new ScriptRunner(conn);
        // doesn't print logger
        // runner.setLogWriter(null);
        Resources.setCharset(StandardCharsets.UTF_8);
        Reader read = Resources.getResourceAsReader(SCHEMA_SQL_FILE);
        LOGGER.info("execute soul schema sql: {}", SCHEMA_SQL_FILE);
        runner.runScript(read);
        runner.closeConnection();
        conn.close();
    }

}
