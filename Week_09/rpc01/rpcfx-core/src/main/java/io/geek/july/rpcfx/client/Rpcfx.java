package io.geek.july.rpcfx.client;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.ParserConfig;
import io.geek.july.rpcfx.api.RpcfxRequest;
import io.geek.july.rpcfx.api.RpcfxResponse;
import io.geek.july.rpcfx.client.callable.HttpCallable;
import io.geek.july.rpcfx.client.callable.RpcfxCallable;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public final class Rpcfx {

    private static final RpcfxCallable PROTOCOL = new HttpCallable();
    static {
        ParserConfig.getGlobalInstance().addAccept("io.geek.july");
    }

    public static <T> T create(final Class<T> serviceClass) {
        final String url = "http://localhost:8080/";
        // 0. 替换动态代理 -> AOP
//        return (T) Proxy.newProxyInstance(Rpcfx.class.getClassLoader(), new Class[]{serviceClass}, new RpcfxInvocationHandler(serviceClass, url));

        RpcfxProxyFactory factory = new RpcfxProxyFactory();
        return factory.create(serviceClass, url, PROTOCOL);
    }

//    public static class RpcfxInvocationHandler implements InvocationHandler {
//
//        public static final MediaType JSONTYPE = MediaType.get("application/json; charset=utf-8");
//
//        private final Class<?> serviceClass;
//        private final String url;
//        public <T> RpcfxInvocationHandler(Class<T> serviceClass, String url) {
//            this.serviceClass = serviceClass;
//            this.url = url;
//        }
//
//        // 可以尝试，自己去写对象序列化，二进制还是文本的，，，rpcfx是xml自定义序列化、反序列化，json: code.google.com/p/rpcfx
//        // int byte char float double long bool
//        // [], data class
//
//        @Override
//        public Object invoke(Object proxy, Method method, Object[] params) throws Throwable {
//            RpcfxRequest request = new RpcfxRequest();
//            request.setServiceClass(this.serviceClass.getName());
//            request.setMethod(method.getName());
//            request.setParams(params);
//
//            RpcfxResponse response = post(request, url);
//
//            // 这里判断response.status，处理异常
//            // 考虑封装一个全局的RpcfxException
//            if (response.getStatus()) {
//                return JSON.parse(response.getResult().toString());
//            } else {
//                throw response.getException();
//            }
//        }
//
//        private RpcfxResponse post(RpcfxRequest req, String url) throws IOException {
//            String reqJson = JSON.toJSONString(req);
//            System.out.println("req json: "+reqJson);
//
//            // 1.可以复用client
//            // 2.尝试使用httpclient或者netty client
//            OkHttpClient client = new OkHttpClient();
//            final Request request = new Request.Builder()
//                    .url(url)
//                    .post(RequestBody.create(JSONTYPE, reqJson))
//                    .build();
//            String respJson = client.newCall(request).execute().body().string();
//            System.out.println("res json: "+respJson);
//            return JSON.parseObject(respJson, RpcfxResponse.class);
//        }
//    }
}
