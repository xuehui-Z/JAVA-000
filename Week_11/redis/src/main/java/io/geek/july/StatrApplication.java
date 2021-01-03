package io.geek.july;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
public class StatrApplication {
    public static void main(String[] args) {
        SpringApplication.run(StatrApplication.class, args);
    }
}
