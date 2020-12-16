package io.geek.july.rpcfx.client.callable;

import io.geek.july.rpcfx.api.RpcfxRequest;
import io.geek.july.rpcfx.api.RpcfxResponse;

public interface  RpcfxCallable {
    <T> RpcfxResponse call(RpcfxRequest<T> req, String url);
}
