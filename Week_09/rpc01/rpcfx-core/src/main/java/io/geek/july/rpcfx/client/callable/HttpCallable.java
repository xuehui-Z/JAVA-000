package io.geek.july.rpcfx.client.callable;

import com.alibaba.fastjson.JSON;
import io.geek.july.rpcfx.api.RpcfxRequest;
import io.geek.july.rpcfx.api.RpcfxResponse;
import io.geek.july.rpcfx.exception.RpcfxException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;


import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class HttpCallable implements RpcfxCallable {
    private final CloseableHttpClient client = HttpClientBuilder.create().build();

    @Override
    public <T> RpcfxResponse call(RpcfxRequest<T> req, String url) {
        StringEntity entity = new StringEntity(JSON.toJSONString(req), StandardCharsets.UTF_8);
        HttpPost httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", "application/json;charset=utf8");
        httpPost.setEntity(entity);
        try {
            CloseableHttpResponse response = client.execute(httpPost);
            int status = response.getStatusLine().getStatusCode();
            if (status != HttpStatus.SC_OK) {
                throw new RpcfxException(-1, "call error. http status code = " + status);
            }
            HttpEntity responseEntity = response.getEntity();
            return JSON.parseObject(EntityUtils.toString(responseEntity), RpcfxResponse.class);
        } catch (IOException e) {
            throw new RpcfxException(-1, e.getMessage());
        }
    }
}
