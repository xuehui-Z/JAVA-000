# Redis学习笔记
### 准备工作
- 下载redis文件 https://github.com/tporadowski/redis/releases。  
  我这里是使用的GitHub上的开源版本，目前已经更新到5.0.10 for windows
- 解压后即可使用
- 配置环境变量，将Redis解压的目录配置到环境变量的Path里面（这一步可以不做）

### 配置主从（一主两从）
- 主节点使用默认的配置，无需更改配置文件。
- 1号从节点使用如下配置文件,配置文件放在Redis目录下
````
# Redis configuration file for port 6380

bind 127.0.0.1
port 6380

# The filename where to dump the DB
dbfilename dump.6380.rdb
dir ./

slaveof 127.0.0.1 6379
````
- 2号从节点使用如下配置文件。  
````
# Redis configuration file for port 6381

bind 127.0.0.1
port 6381

# The filename where to dump the DB
dbfilename dump.6380.rdb
dir ./

# slaveof 127.0.0.1 6379
````
- 分别启动Redis服务  
  进入解压后的Redis目录
  - 启动主节点： ``redis-server .\redis.windows.conf``  
  - 启动从节点： ``redis-server .\redis.windows.6380.conf``  
  - 启动从节点： ``redis-server .\redis.windows.6381.conf``  
- 分别进入Redis客户端
    ````
   redis-cli -h localhost -p 6379
   redis-cli -h localhost -p 6380
   redis-cli -h localhost -p 6381
    ````
  如果配置文件没有配置主从关系的话，也可以在客户端里直接执行该命令``slaveof 127.0.0.1 6379``
- 使用该命令``info Replication``查看主从关系
  ````
  localhost:6379> info Replication
  # Replication
  role:master
  connected_slaves:2
  slave0:ip=127.0.0.1,port=6381,state=online,offset=1162,lag=1
  slave1:ip=127.0.0.1,port=6380,state=online,offset=1162,lag=1
  master_replid:c0fff338f28ed219e1622e835a0fca29c789c55f
  master_replid2:0000000000000000000000000000000000000000
  master_repl_offset:1162
  second_repl_offset:-1
  repl_backlog_active:1
  repl_backlog_size:1048576
  repl_backlog_first_byte_offset:1
  repl_backlog_histlen:1162
  ````

### Redis哨兵（sentinel）
- 跟上面操作一样，启动一主两从的Redis
- 配置哨兵
  - 编辑配置文件
  ````
  #sentinel26379.conf
    port 26379
    sentinel monitor mymaster 127.0.0.1 6381 2
    sentinel down-after-milliseconds mymaster 10000
  #sentinel26380.conf
    port 26380
    sentinel monitor mymaster 127.0.0.1 6381 2
    sentinel down-after-milliseconds mymaster 10000
  #sentinel26381.conf
    port 26381
    sentinel monitor mymaster 127.0.0.1 6381 2
    sentinel down-after-milliseconds mymaster 10000
  ````
  ````
  配置说明：
  port:指定哨兵运行端口号。  
  sentinel monitor <masterName> <ip> <port> <quorum>
    masterName这个是对某个master+slave组合的一个区分标识（一套sentinel是可以监听多套master+slave这样的组合的）。
    ip 和 port 就是master节点的 ip 和 端口号。
    quorum这个参数是进行客观下线的一个依据，意思是至少有 quorum 个sentinel主观的认为这个master有故障，才会对这个master进行下线以及故障转移。因为有的时候，某个sentinel节点可能因为自身网络原因，导致无法连接master，而此时master并没有出现故障，所以这就需要多个sentinel都一致认为该master有问题，才可以进行下一步操作，这就保证了公平性和高可用。
    那么，多个sentinel之间是如何达到共识的呢？
    这就是依赖于前面说的第二个定时任务，某个sentinel先将master节点进行一个主观下线，然后会将这个判定通过sentinel is-master-down-by-addr这个命令问对应的节点是否也同样认为该addr的master节点要做客观下线。最后当达成这一共识的sentinel个数达到前面说的quorum设置的这个值时，就会对该master节点下线进行故障转移。quorum的值一般设置为sentinel个数的二分之一加1，例如3个sentinel就设置2。
  sentinel down-after-milliseconds <masterName> <timeout>
    masterName这个参数不用说了，跟上一的一样。
    timeout是一个毫秒值，表示：如果这台sentinel超过timeout这个时间都无法连通master包括slave（slave不需要客观下线，因为不需要故障转移）的话，就会主观认为该master已经下线（实际下线需要客观下线的判断通过才会下线）
  ````
- 启动哨兵
  ````
  redis-server .\sentinel26379.conf --sentinel
  redis-server .\sentinel26380.conf --sentinel
  redis-server .\sentinel26381.conf --sentinel
  ````
- 查看主从关系
  ````
  localhost:6379> info Replication
  # Replication
  role:master
  connected_slaves:2
  slave0:ip=127.0.0.1,port=6380,state=online,offset=3194,lag=1
  slave1:ip=127.0.0.1,port=6381,state=online,offset=3194,lag=1
  master_replid:95f680d644973a4fafe223f65408e154188f77fd
  master_replid2:0000000000000000000000000000000000000000
  master_repl_offset:3194
  second_repl_offset:-1
  repl_backlog_active:1
  repl_backlog_size:1048576
  repl_backlog_first_byte_offset:1
  repl_backlog_histlen:3194
  ````
- 关闭6379Redis服务，查看主从关系
  ````
  localhost:6380> info Replication
  # Replication
  role:slave
  master_host:127.0.0.1
  master_port:6381
  master_link_status:up
  master_last_io_seconds_ago:0
  master_sync_in_progress:0
  slave_repl_offset:8019
  slave_priority:100
  slave_read_only:1
  connected_slaves:0
  master_replid:89349eb6a353dce9ad8ca0f4ca77c564f9c4e1dd
  master_replid2:95f680d644973a4fafe223f65408e154188f77fd
  master_repl_offset:8019
  second_repl_offset:6135
  repl_backlog_active:1
  repl_backlog_size:1048576
  repl_backlog_first_byte_offset:1
  repl_backlog_histlen:8019
  ````
  可以看到master已经变成了6381
- 接下来再启动6379,并查看主从关系
  ````
  localhost:6379> info Replication
  # Replication
  role:slave
  master_host:127.0.0.1
  master_port:6381
  master_link_status:up
  master_last_io_seconds_ago:1
  master_sync_in_progress:0
  slave_repl_offset:17289
  slave_priority:100
  slave_read_only:1
  connected_slaves:0
  master_replid:89349eb6a353dce9ad8ca0f4ca77c564f9c4e1dd
  master_replid2:0000000000000000000000000000000000000000
  master_repl_offset:17289
  second_repl_offset:-1
  repl_backlog_active:1
  repl_backlog_size:1048576
  repl_backlog_first_byte_offset:14859
  repl_backlog_histlen:2431
  ````
  可以看到6379已经成为了slave。
  
### Cluster 集群
- 配置开启节点
  ````
  #redis.windows.7000.conf
  port 7000
  daemonize yes
  dir ./data
  dbfilename redis.7000.data
  cluster-enabled yes
  cluster-config-file nodes-7000.conf
  cluster-require-full-coverage no
  ````
  按照此格式配置复制两份出来，设置端口分别为7000，7001，7002  
  启动Redis服务
  ````
   redis-server .\redis.windows.7000.conf
   redis-server .\redis.windows.7001.conf
   redis-server .\redis.windows.7002.conf
  ````
- meet
  ````
  redis-cli -p 7000 cluster meet 127.0.0.1 7001
  redis-cli -p 7000 cluster meet 127.0.0.1 7002
  ````
  之后查看关系情况
  ````
    PS D:\work\Redis-x64-5.0.10> redis-cli -p 7001 cluster nodes # 通过7000端口运行的redis server查看cluster的节点信息，已经添加7001端口运行的redis server,且都为master节点
    17d5a0c733f401e0c418c1dee4fe0165a5f41c72 127.0.0.1:7002@17002 master - 0 1609848794845 2 connected
    763b76b1925682307b96bab81e34cc91ff11d098 127.0.0.1:7001@17001 myself,master - 0 1609848793000 0 connected
    33c2e59b87ef465db08573072a556d7a98304644 127.0.0.1:7000@17000 master - 0 1609848795851 1 connected 0-4808
    PS D:\work\Redis-x64-5.0.10> redis-cli -p 7002 cluster info  # 查看集群相关的信息
    cluster_state:fail  # 集群状态为失败
    cluster_slots_assigned:5146
    cluster_slots_ok:0
    cluster_slots_pfail:0
    cluster_slots_fail:0
    cluster_known_nodes:3  # 集群中有3个已知节点
    cluster_size:1
    cluster_current_epoch:2
    cluster_my_epoch:2
    cluster_stats_messages_ping_sent:2351
    cluster_stats_messages_pong_sent:2363
    cluster_stats_messages_sent:4714
    cluster_stats_messages_ping_received:2363
    cluster_stats_messages_pong_received:2351
    cluster_stats_messages_received:4714  
  ````
- 指派槽
  这里不借助工具，没有找到比较好的方法，windows上编写Bat脚本执行
  ````
  @echo off
  for /l %%i in (%1,1,%2) do (
  	redis-cli -p %3 cluster addslots %%i
  	)
  ````
  接着执行脚本，会有点慢。。。
  ````
   .\test.bat 0 5500 7000
   .\test.bat 5501 11000 7001 
   .\test.bat 11001 16384 7002
  ````
  完成这一步，整个集群算是搭好了，执行set命令
  ````
  # 登录一个客户端
  redis-cli -c -p 7000
  127.0.0.1:7000> set hello world
  OK
  127.0.0.1:7000> get hello
  "world"
  127.0.0.1:7000> set kiki tt
  -> Redirected to slot [10344] located at 127.0.0.1:7001
  OK
  127.0.0.1:7001> get kiki
  "tt"
  ````
- 主从关系分配
  再按照前面配置针对于每个节点配置主从服务器，达到高可用