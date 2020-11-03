# 学习笔记 IO
### 基本的服务器通信
- **简单的HTTP服务器:** 单一的线程执行
  ```java
  public class HttpServer01 {
    public static void main(String[] args) throws IOException{
		//1.创建一个 ServerSocket
		//2.绑定8801端口
        ServerSocket serverSocket = new ServerSocket(8801);
        while (true) {
            try {
				//3.当有客户端请求时通过 accept 方法拿到 Socket，进而可以进行处理
                Socket socket = serverSocket.accept();
                service(socket);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    //4.模拟输出 HTTP 报文头和 hello
    private static void service(Socket socket) {
        try {
            Thread.sleep(20);
            PrintWriter printWriter = new PrintWriter(socket.getOutputStream(), true);
            printWriter.println("HTTP/1.1 200 OK");
            printWriter.println("Content-Type:text/html;charset=utf-8");
            String body = "hello,nio";
            printWriter.println("Content-Length:" + body.getBytes().length);
            printWriter.println();
            printWriter.write(body);
            printWriter.close();
            socket.close();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
  }
  ```
- **改进一下:** 每有一个请求，启动一个线程执行操作
  ```java
    public static void main(String[] args) throws IOException{
        ServerSocket serverSocket = new ServerSocket(8802);
        while (true) {
            try {
                final Socket socket = serverSocket.accept();
                new Thread(() -> {
                    service(socket);
                }).start();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
  ```
- **再次改进一下:** 使用线程池，处理每个请求的操作
  ```java
	public static void main(String[] args) throws IOException{
        ExecutorService executorService = Executors.newFixedThreadPool(40);
        final ServerSocket serverSocket = new ServerSocket(8803);
        while (true) {
            try {
                final Socket socket = serverSocket.accept();
                executorService.execute(() -> service(socket));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
  ```
### IO通信（五种线程模型）
CPU说，这个世界慢死了。
- **线程模型Ⅰ：阻塞IO (BIO)**  
  一般通过在 while(true) 循环中服务端会调用 accept() 方法等待接收客户端的连接的方式监听请求，请求一旦接收到一个连接请求，就可以建立通信套接字在这个通信套接字上进行读写操作，此时不能再接收其他客户端连接请求，只能等待同当前连接的客户端的操作执行完成， 不过可以通过多线程来支持多个客户端的连接
- **线程模型Ⅱ：非阻塞IO**  
  和阻塞 IO 类比，内核会立即返回，返回后获得足够的 CPU 时间继续做其它的事情。  
  用户进程第一个阶段不是阻塞的,需要不断的主动询问 kernel 数据好了没有；第二个阶段依然总是阻塞的。
- **线程模型Ⅲ：IO复用**   
  IO 多路复用(IO multiplexing)，也称事件驱动 IO(event-driven IO)，就是在单个线程里同时监控多个套接字，通过select 或 poll 轮询所负责的所有socket，当某个 socket 有数据到达了，就通知用户进程。  
  IO 复用同非阻塞 IO 本质一样，不过利用了新的 select 系统调用，由内核来负责本来是请求进程该做的轮询操作。看似比非阻塞 IO 还多了一个系统调用开销，不过因为可以支持多路 IO，才算提高了效率。
  进程先是阻塞在 select/poll 上，再是阻塞在读操作的第二个阶段上。  
- **线程模型Ⅳ：信号驱动IO**  
  信号驱动 IO 与 BIO 和 NIO 最大的区别就在于，在 IO 执行的数据准备阶段，不会阻塞用户进程。  
  如图所示：当用户进程需要等待数据的时候，会向内核发送一个信号，告诉内核我要什么数据，然后用户进程就继续做别的事情去了，而当内核中的数据准备好之后，内核立马发给用户进程一个信号，说”数据准备好了，快来查收“，用户进程收到信号之后，立马调用 recvfrom，去查收数据。  
- **线程模型Ⅳ：异步IO**   
  异步 IO 真正实现了 IO 全流程的非阻塞。用户进程发出系统调用后立即返回，内核等待数据准备完成，然后将数据拷贝到用户进程缓冲区，然后发送信号告诉用户进程 IO 操作执行完毕（与 SIGIO 相比，一个是发送信号告诉用户进程数据准备完毕，一个是 IO执行完毕）。  
### Netty框架
- **Netty的基本概念**
  - Channel 通道，Java NIO 中的基础概念,代表一个打开的连接,可执行读取/写入 IO 操作。Netty 对 Channel 的所有 IO 操作都是非阻塞的。  
  - ChannelFuture Java 的 Future 接口，只能查询操作的完成情况, 或者阻塞当前线程等待操作完成。Netty 封装一个 ChannelFuture 接口。我们可以将回调方法传给 ChannelFuture，在操作完成时自动执行  
  - Event & Handler Netty 基于事件驱动，事件和处理器可以关联到入站和出站数据流。  
  - Encoder & Decoder 处理网络 IO 时，需要进行序列化和反序列化, 转换 Java 对象与字节流。对入站数据进行解码, 基类是 ByteToMessageDecoder。对出站数据进行编码, 基类是 MessageToByteEncoder。  
  - ChannelPipeline 数据处理管道就是事件处理器链。有顺序、同一 Channel 的出站处理器和入站处理器在同一个列表中  
- **Netty关键对象**  
  - Bootstrap: 启动线程，开启 socket  
  - EventLoopGroup: 线程池  
  - EventLoop: 线程  
  - SocketChannel: 连接  
  - ChannelInitializer: 初始化  
  - ChannelPipeline: 处理器链  
  - ChannelHandler: 处理器