package io.geek.july.activemq.queue;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;

import javax.jms.*;

public class Producer {
    public static void main(String[] args) throws JMSException {
        // 定义Destination
         Destination destination = new ActiveMQQueue("test.queue");
        // 创建连接和会话
        ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://127.0.0.1:61616");
        ActiveMQConnection conn = null;
        Session session = null;
        try {
            conn = (ActiveMQConnection) factory.createConnection();
            conn.start();
            session = conn.createSession(false, Session.AUTO_ACKNOWLEDGE);
            // 创建生产者，生产100个消息
            MessageProducer producer = session.createProducer(destination);
            int index = 0;
            while (index++ < 100) {
                TextMessage message = session.createTextMessage(index + " message.");
                producer.send(message);
            }

        } catch (JMSException e) {
            e.printStackTrace();
        } finally {
            session.close();
            conn.close();
        }

    }
}
