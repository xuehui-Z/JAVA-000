package io.geek.july.rpcfx.client;

import io.geek.july.rpcfx.client.callable.RpcfxCallable;
import org.springframework.cglib.proxy.Enhancer;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class RpcfxProxyFactory {

    private static final Map<String, Object> CACHE = new ConcurrentHashMap<>();

    public <T> T create(final Class<T> serviceClass, final String url, final RpcfxCallable protocol) {
        if (CACHE.containsKey(serviceClass.getName())) {
            return (T) CACHE.get(serviceClass.getName());
        }
        synchronized (CACHE) {
            if (CACHE.containsKey(serviceClass.getName())) {
                return (T) CACHE.get(serviceClass.getName());
            }
            T result = doCreate(serviceClass, url, protocol);
            CACHE.putIfAbsent(serviceClass.getName(), result);
            return result;
        }
    }

    private <T> T doCreate(final Class<T> serviceClass, final String url, final RpcfxCallable protocol) {
        return (T) Enhancer.create(serviceClass, new RpcfxInterceptor(serviceClass, url, protocol));
    }
}
