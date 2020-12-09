package com.geekbang.java.service.main;

import com.geekbang.java.service.OrderDeamService;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.shardingsphere.driver.api.ShardingSphereDataSourceFactory;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.sharding.api.config.ShardingRuleConfiguration;
import org.apache.shardingsphere.sharding.api.config.rule.ShardingTableRuleConfiguration;
import org.apache.shardingsphere.sharding.api.config.strategy.sharding.StandardShardingStrategyConfiguration;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class ShardingMain {
    public static void main(String[] args) throws IOException, SQLException {
        // 配置真实数据源
        Map<String, DataSource> dataSourceMap = new HashMap<>();

        // 配置第 1 个数据源
        BasicDataSource dataSource1 = new BasicDataSource();
        dataSource1.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource1.setUrl("jdbc:mysql://localhost:3306/ds0");
        dataSource1.setUsername("root");
        dataSource1.setPassword("");
        dataSourceMap.put("ds0", dataSource1);

        // 配置第 2 个数据源
        BasicDataSource dataSource2 = new BasicDataSource();
        dataSource2.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource2.setUrl("jdbc:mysql://localhost:3306/ds1");
        dataSource2.setUsername("root");
        dataSource2.setPassword("");
        dataSourceMap.put("ds1", dataSource2);

        // 配置 t_order 表规则
        ShardingTableRuleConfiguration orderTableRuleConfig = new ShardingTableRuleConfiguration("t_order", "ds${0..1}.t_order${1..16}");

        // 配置分库策略
        orderTableRuleConfig.setDatabaseShardingStrategy(new StandardShardingStrategyConfiguration("user_id", "dbShardingAlgorithm"));

        // 配置分表策略
        orderTableRuleConfig.setTableShardingStrategy(new StandardShardingStrategyConfiguration("order_id", "tableShardingAlgorithm"));

        // 配置分片规则
        ShardingRuleConfiguration shardingRuleConfig = new ShardingRuleConfiguration();
        shardingRuleConfig.getTables().add(orderTableRuleConfig);

        // 配置分库算法
        Properties dbShardingAlgorithmrProps = new Properties();
        dbShardingAlgorithmrProps.setProperty("algorithm-expression", "ds${user_id % 2}");
        shardingRuleConfig.getShardingAlgorithms().put("dbShardingAlgorithm", new ShardingSphereAlgorithmConfiguration("INLINE", dbShardingAlgorithmrProps));

        // 配置分表算法
        Properties tableShardingAlgorithmrProps = new Properties();
        tableShardingAlgorithmrProps.setProperty("algorithm-expression", "t_order${order_id % 16}");
        shardingRuleConfig.getShardingAlgorithms().put("tableShardingAlgorithm", new ShardingSphereAlgorithmConfiguration("INLINE", tableShardingAlgorithmrProps));

        // 创建 ShardingSphereDataSource
        DataSource dataSource = ShardingSphereDataSourceFactory.createDataSource(dataSourceMap, Collections.singleton(shardingRuleConfig), new Properties());
        Connection conn = dataSource.getConnection();

        String insertSql = "insert into t_order(id,user_id,order_id,addr_id,goods_id,unit_price,quantity,amount) " +
                "values(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(insertSql);
        ps.setInt(1, 3);
        ps.setInt(2, 10);
        ps.setInt(3, 10);
        ps.setInt(4, 10);
        ps.setInt(5, 10);
        ps.setInt(6, 10);
        ps.setInt(7, 10);
        ps.setInt(8, 10);
        ps.execute();

        String selectSql = "select * from t_order";
        PreparedStatement sps = conn.prepareStatement(selectSql);
        ResultSet res = sps.executeQuery();
        while(res.next()) {
            System.out.println(res.toString());
        }
    }
}
