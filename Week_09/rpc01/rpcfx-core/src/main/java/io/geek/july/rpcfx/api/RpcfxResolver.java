package io.geek.july.rpcfx.api;

public interface RpcfxResolver<T> {

    T resolve(String serviceClass);

}
