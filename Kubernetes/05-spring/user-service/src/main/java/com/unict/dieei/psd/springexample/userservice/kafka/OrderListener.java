package com.unict.dieei.psd.springexample.userservice.kafka;

import com.unict.dieei.psd.springexample.userservice.controller.UserController;
import com.unict.dieei.psd.springexample.userservice.repository.ReactiveUserRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import reactor.core.publisher.Mono;

import java.util.List;

public class OrderListener {

    @Autowired
    ReactiveUserRepository repository;


    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @Value(value = "${KAFKA_MAIN_TOPIC}")
    private String mainTopic;

    @KafkaListener(topics="${KAFKA_MAIN_TOPIC}")
    public void listen(String message) {
        System.out.println("Received message " + message);

        String[] messageParts = message.split("\\|");

        if (messageParts[0].equals("OrderCreated")) {
            String uid = messageParts[1];
            repository.existsById(new ObjectId(uid)).flatMap(exists -> {
                kafkaTemplate.send(mainTopic, (exists?"UserExists|":"UserNotExists|") + messageParts[2]);
                return Mono.just(exists);
            }).subscribe();
        }
    }
}
