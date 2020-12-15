package io.geek.july.rpcfx.demo.api;

import io.geek.july.rpcfx.demo.domain.User;

public interface UserService {

    User findById(int id);

}
