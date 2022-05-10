package com.fank.kafka_test.controller;

import com.fank.kafka_test.service.KafkaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class KafkaController {

    @Autowired
    private KafkaService kafkaService;

    @GetMapping("kafka/{msg}")
    public String say(@PathVariable String msg) {
        kafkaService.sendMsg("fank", "msg: " + msg);
        return "msg: " + msg;
    }
}
