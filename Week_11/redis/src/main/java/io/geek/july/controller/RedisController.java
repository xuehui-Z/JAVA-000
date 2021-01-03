package io.geek.july.controller;

import io.geek.july.lock.RedisTemplateDemo;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class RedisController {

    @RequestMapping("/locktest")
    String test() {
        new Thread(this::distributedLock, "T1").start();
        new Thread(this::distributedLock, "T2").start();
        new Thread(this::distributedLock, "T3").start();
        new Thread(this::distributedLock, "T4").start();
        return "success";
    }

    public void distributedLock() {
        RedisTemplateDemo redisTemplateDemo = new RedisTemplateDemo();
        redisTemplateDemo.lock("happylock",Thread.currentThread().getName());
    }
}
