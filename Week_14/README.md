学习笔记
## 说明

第一个版本，完全基于内存queue的消息队列，实现了最基础的三个功能：

- 创建topic
- 订阅topic和poll消息
- 发送消息到topic

具体参见demo.KmqDemo

作业实现：  
第二个版本：自定义Queue
2、去掉内存Queue，设计自定义Queue，实现消息确认和消费offset
1）自定义内存Message数组模拟Queue。
2）使用指针记录当前消息写入位置。
    kmq中使用指针记录生产所到达的位置
    producer和consumer分别用一个指针记录自己生产和消费的位置
3）对于每个命名消费者，用指针记录消费位置