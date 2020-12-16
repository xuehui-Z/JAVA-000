package io.geek.july.rpcfx.client;

import io.geek.july.rpcfx.api.RpcfxRequest;
import io.geek.july.rpcfx.api.RpcfxResponse;
import io.geek.july.rpcfx.client.callable.RpcfxCallable;
import io.geek.july.rpcfx.exception.RpcfxException;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;
import java.util.Objects;

public class RpcfxInterceptor<T> implements MethodInterceptor {
    private final Class<T> serviceClass;
    private final String url;
    private final RpcfxCallable callable;
    public RpcfxInterceptor(Class<T> serviceClass, String url, RpcfxCallable callable) {
        this.serviceClass = serviceClass;
        this.url = url;
        this.callable = callable;
    }
    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        RpcfxRequest<T> request = new RpcfxRequest<T>();
        request.setServiceClass(this.serviceClass);
        request.setMethod(method.getName());
        request.setParams(objects);
        RpcfxResponse response = callable.call(request, url);
        return handleResponse(response);
    }
    private Object handleResponse(RpcfxResponse response) {
        if (response.getStatus()) {
            return response.getResult();
        }

        RpcfxException rpcfxException = response.getException();
        if (Objects.nonNull(rpcfxException)) {
            throw rpcfxException;
        }
        throw new RpcfxException(-1,"unknown error.");
    }
}
