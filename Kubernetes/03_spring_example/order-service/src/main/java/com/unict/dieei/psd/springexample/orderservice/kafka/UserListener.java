package com.unict.dieei.psd.springexample.orderservice.kafka;


import com.unict.dieei.psd.springexample.orderservice.model.OrderStatus;
import com.unict.dieei.psd.springexample.orderservice.repository.ReactiveOrderRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

@Service
public class UserListener {

    @Autowired
    ReactiveOrderRepository repository;


    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @Value(value = "${KAFKA_MAIN_TOPIC}")
    private String mainTopic;

    @KafkaListener(topics="${KAFKA_MAIN_TOPIC}")
    public void listen(String message) {
        System.out.println("Received message " + message);

        String[] messageParts = message.split("\\|");

        if (messageParts[0].equals("UserExists")) {
            String oid = messageParts[1];
            setOrderStatus(message, oid, OrderStatus.CONFIRMED, "OrderConfirmed|");
        }

        if (messageParts[0].equals("UserNotExists")) {
            String oid = messageParts[1];
            ObjectId ooid = new ObjectId(oid);
            setOrderStatus(message, oid, OrderStatus.DELETED, "OrderDeleted|");
        }

    }

    private void setOrderStatus(String message, String oid, OrderStatus status, String key) {
        repository.existsById(new ObjectId(oid)).flatMap(exists -> {
            if (exists) {
                repository.findById(new ObjectId(oid)).flatMap(order -> {
                    order.setStatus(status);
                    return repository.save(order);
                }).subscribe();

                kafkaTemplate.send(mainTopic, key + oid);
            } else {
                kafkaTemplate.send(mainTopic,"BadMessage||" + message);
            }
            return Mono.just(exists);
        }).subscribe();
    }

}
