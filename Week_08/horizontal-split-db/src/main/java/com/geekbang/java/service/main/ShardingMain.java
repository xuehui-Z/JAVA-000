package com.geekbang.java.service.main;

import com.geekbang.java.service.OrderDeamService;

import java.io.IOException;
import java.sql.SQLException;

public class ShardingMain {
    public static void main(String[] args) throws IOException, SQLException {
        OrderDeamService orderService = new OrderDeamService("application.yml");

        orderService.insert();

    }
}
