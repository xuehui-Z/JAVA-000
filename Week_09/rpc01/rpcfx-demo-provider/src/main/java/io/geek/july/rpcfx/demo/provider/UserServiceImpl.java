package io.geek.july.rpcfx.demo.provider;

import io.geek.july.rpcfx.demo.api.User;
import io.geek.july.rpcfx.demo.api.UserService;

public class UserServiceImpl implements UserService {

    @Override
    public User findById(int id) {
        return new User(id, "KK" + System.currentTimeMillis());
    }
}
