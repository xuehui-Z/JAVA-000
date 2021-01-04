# Redis学习笔记
### 准备工作
- 下载redis文件 https://github.com/tporadowski/redis/releases。  
  我这里是使用的GitHub上的开源版本，目前已经更新到5.0.10 for windows
- 解压后即可使用

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