package com.fank.kafka_test_consumer.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ConsumerService {

    @KafkaListener(topics = "fank")
    public void onMessage(String msg) {
        log.error("KafkaListener: received msg " + msg);
    }
}
