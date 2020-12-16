package io.geek.july.rpcfx.demo.api;

import io.geek.july.rpcfx.demo.domain.Order;

public interface OrderService {

    Order findOrderById(int id);

}
