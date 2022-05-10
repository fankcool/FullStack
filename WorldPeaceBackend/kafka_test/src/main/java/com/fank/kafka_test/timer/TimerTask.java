package com.fank.kafka_test.timer;

import com.fank.kafka_test.service.KafkaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
public class TimerTask {

    @Autowired
    private KafkaService kafkaService;

    @Scheduled(cron = "*/5 * * * * ? ")
    public void task(){
        log.info("" + new Date());
        kafkaService.sendMsgToTpName();
    }
}
