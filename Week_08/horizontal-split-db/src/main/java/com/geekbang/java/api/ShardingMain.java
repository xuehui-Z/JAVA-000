package com.geekbang.java.api;

import com.geekbang.java.init.InitDatabase;
import com.geekbang.java.pojo.Order;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static jdk.nashorn.internal.objects.Global.print;

public class ShardingMain {
    public static void main(String[] args) {

        InitDatabase.init();
        // 创建 ShardingSphereDataSource
        DataSource dataSource = null;
        try {
            dataSource = ShardingConfig.shardingDataSource();
            insertData(dataSource,5);
            String sql = "select * from t_order";
            List<Order> res = queryData(dataSource,sql);
            print(res);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static List<Order> queryData(DataSource dataSource, String sql) throws SQLException {
        Connection conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet res = ps.executeQuery();
        List<Order> result = new ArrayList<>();
        while(res.next()) {
            Order order = new Order();
            order.setId(res.getInt("id"));
            order.setUserId(res.getInt("user_id"));
            order.setOrderId(res.getInt("order_id"));
        }
        return result;
    }

    private static void insertData(DataSource dataSource, int count) throws SQLException {
        String insertSql = "insert into t_order(id,user_id,order_id,addr_id,goods_id,unit_price,quantity,amount) " +
                "values(?,?,?,?,?,?,?,?)";
        Connection conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(insertSql);
        int index=0;
        while (index < count) {
            ps.setInt(1, UUID.randomUUID().variant());
            ps.setInt(2, (int) Math.random());
            ps.setInt(3, (int) Math.random());
            ps.setInt(4, (int) Math.random());
            ps.setInt(5, (int) Math.random());
            ps.setInt(6, (int) Math.random());
            ps.setInt(7, (int) Math.random());
            ps.setInt(8, (int) Math.random());
            ps.addBatch();
            index++;
        }
        ps.execute();
    }
}
