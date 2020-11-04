package io.github.kimmking.gateway.outbound.httpclient4;

import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.http.*;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.nio.client.CloseableHttpAsyncClient;
import org.apache.http.impl.nio.client.HttpAsyncClients;
import org.apache.http.impl.nio.reactor.IOReactorConfig;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import static io.netty.handler.codec.http.HttpResponseStatus.OK;
import static io.netty.handler.codec.http.HttpVersion.HTTP_1_1;

public class MyOutboundhandler {
    //URL
    private String backendUrl;
    //http client
    //private CloseableHttpClient httpclient;
    private CloseableHttpAsyncClient httpclient;

    public MyOutboundhandler(String backendUrl) {
        this.backendUrl = backendUrl.endsWith("/") ? backendUrl.substring(0, backendUrl.length() - 1) : backendUrl;
        //httpclient = HttpClients.createDefault();
        IOReactorConfig ioConfig = IOReactorConfig.custom()
                .setConnectTimeout(1000)
                .setSoTimeout(1000)
                .setIoThreadCount(Runtime.getRuntime().availableProcessors() * 2)
                .setRcvBufSize(32 * 1024)
                .build();
        httpclient = HttpAsyncClients.custom().setMaxConnTotal(40)
                .setMaxConnPerRoute(8)
                .setDefaultIOReactorConfig(ioConfig)
                .setKeepAliveStrategy((response, context) -> 6000)
                .build();
        httpclient.start();
    }

    public void handle(final FullHttpRequest fullRequest, final ChannelHandlerContext ctx) {
        String url = this.backendUrl + fullRequest.uri();
        HttpGet httpGet = new HttpGet(url);
        httpGet.setHeader(HTTP.CONN_DIRECTIVE, HTTP.CONN_KEEP_ALIVE);
        httpclient.execute(httpGet, new FutureCallback<org.apache.http.HttpResponse>() {
            @Override
            public void completed(final org.apache.http.HttpResponse endpointResponse) {
                FullHttpResponse response = null;
                try {
                    byte[] body = EntityUtils.toByteArray(endpointResponse.getEntity());
                    response = new DefaultFullHttpResponse(HTTP_1_1, OK, Unpooled.wrappedBuffer(body));
                    response.headers().set("Content-Type", "application/json");
                    response.headers().setInt("Content-Length", Integer.parseInt(endpointResponse.getFirstHeader("Content-Length").getValue()));
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (fullRequest != null) {
                        if (!HttpUtil.isKeepAlive(fullRequest)) {
                            //ctx 可以些什么样的对象 CloseableHttpResponse返回到画面没有信息？？
                            //ctx.write("hello ctx");
                            ctx.write(response).addListener(ChannelFutureListener.CLOSE);
                        } else {
                            //ctx.write("hello ctx");
                            ctx.write(response);
                        }
                    }
                    ctx.flush();
                }
            }

            @Override
            public void failed(final Exception ex) {
                httpGet.abort();
                ex.printStackTrace();
            }

            @Override
            public void cancelled() {
                httpGet.abort();
            }
        });
    }


}

