package com.fank.redisredisson.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.time.Duration;

@Slf4j
@RestController
public class RedissonController {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @PostConstruct
    private void init() {
        redisTemplate.opsForValue().set("name", "洛耀生");
    }

    @GetMapping("find")
    public String find() {
        String value = redisTemplate.opsForValue().get("name");
        log.error("find value: " + value);
        return "find value: " + value;
    }

    @GetMapping("update/{name}")
    public String update(@PathVariable String name) {
        redisTemplate.opsForValue().set("name", name);
        String value = redisTemplate.opsForValue().get("name");
        log.error("update value: " + value);
        return "update value: " + value;
    }

    @GetMapping("updatenx/{name}")
    public String updateNX(@PathVariable String name) {
        redisTemplate.opsForValue().setIfAbsent("name", name, Duration.ofSeconds(3));
        String value = redisTemplate.opsForValue().get("name");
        log.error("updateNX value: " + value);
        return "updateNX value: " + value;
    }
}
