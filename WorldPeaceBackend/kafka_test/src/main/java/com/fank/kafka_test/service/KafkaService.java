package com.fank.kafka_test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Component
public class KafkaService {

    int value = 0;

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    public void sendMsg(String topic, String msg) {
        kafkaTemplate.send(topic, msg);
    }

    public void sendMsgToTpName() {
        sendMsg("fank", "洛耀生 from KafkaService " + ++value);
    }
}
