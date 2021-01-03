package io.geek.july.count;

import io.geek.july.lock.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.GenericToStringSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class RedisCounter {
    private static final Long INIT_COUNT_VALUE = 1L;
    @Autowired
    private RedisTemplate redisTemplate;

    public RedisCounter() {
        this.redisTemplate = RedisUtil.redis;
    }

    public Long increment(String key) throws InterruptedException {
        String count = (String) redisTemplate.opsForValue().get(key);
        if (count == null) {
            redisTemplate.opsForValue().set(key, INIT_COUNT_VALUE);
            return INIT_COUNT_VALUE;
        } else {
            return redisTemplate.opsForValue().increment(key, 1);
        }
    }

    public String get(String key) {
        return (String) redisTemplate.boundValueOps(key).get();
    }

    public void releaseCount(String key) {
        redisTemplate.delete(key);
    }
}
