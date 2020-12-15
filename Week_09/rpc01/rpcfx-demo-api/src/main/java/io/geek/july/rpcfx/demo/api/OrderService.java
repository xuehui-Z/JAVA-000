package io.geek.july.rpcfx.demo.api;

import io.geek.july.rpcfx.demo.domain.Order;
import io.geek.july.rpcfx.demo.dynamic.RPC;

@RPC
public interface OrderService {

    Order findOrderById(int id);

}
