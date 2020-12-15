package io.geek.july.rpcfx.demo.provider;

import io.geek.july.rpcfx.demo.domain.Order;
import io.geek.july.rpcfx.demo.api.OrderService;

public class OrderServiceImpl implements OrderService {

    @Override
    public Order findOrderById(int id) {
        return new Order(id, "Cuijing" + System.currentTimeMillis(), 9.9f);
    }
}
