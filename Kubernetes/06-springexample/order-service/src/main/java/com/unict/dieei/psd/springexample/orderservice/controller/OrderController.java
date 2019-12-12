package com.unict.dieei.psd.springexample.orderservice.controller;

import com.unict.dieei.psd.springexample.orderservice.model.Order;
import com.unict.dieei.psd.springexample.orderservice.repository.ReactiveOrderRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.mongodb.core.ReactiveMongoOperations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.concurrent.ExecutionException;

@RestController
public class OrderController {

    @Autowired
    ReactiveOrderRepository repository;

    @Autowired
    ReactiveMongoOperations operations;

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @Value(value="${KAFKA_MAIN_TOPIC}")
    private String maintopic;

    @GetMapping("/")
    public Flux<Order> getOrders() {
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrder(@PathVariable("id") String id) {
        Order o = repository.findById(new ObjectId(id)).block();
        if (o == null) {
            return new ResponseEntity<>(o, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(o, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> deleteOrder(@PathVariable("id") String id) {
        Boolean ret = repository.existsById(new ObjectId(id)).block();
        if (ret) {
            repository.deleteById(new ObjectId(id)).subscribe();
            return new ResponseEntity<>(true, HttpStatus.OK);
        }
        return new ResponseEntity<>(false, HttpStatus.NOT_FOUND);
    }

    @PutMapping(path="/{id}", consumes={"application/JSON"}, produces="application/json")
    public ResponseEntity<Mono<Order>> editOrder(@PathVariable("id") String id, @RequestBody Order o) {
        ObjectId oid = new ObjectId(id);
        Order old = repository.findById(oid).block();
        if (old == null)
            return new ResponseEntity<>(Mono.just(new Order(null, null)), HttpStatus.NOT_FOUND);

        o.set_id(oid);

        return new ResponseEntity<>(repository.save(o), HttpStatus.OK);
    }

    @PostMapping(path="/", consumes = "application/JSON", produces = "application/JSON")
    public Mono<Order> newOrder(@RequestBody Order o) {
        return repository.save(o).flatMap(order -> {
            //System.out.println("Sending on the topic");
            kafkaTemplate.send(maintopic, "OrderCreated|" + o.get_user_string() + "|" + o.get_id_string());
            return Mono.just(o);
        });
        //return o;
    }

    @GetMapping(path="/{id}/exists")
    public Mono<Boolean> exists(@PathVariable("id") String id) {
        ObjectId oid = new ObjectId(id);
        return repository.existsById(oid);
    }
}
