package com.unict.dieei.psd.springexample.userservice.controller;

import com.unict.dieei.psd.springexample.userservice.model.User;
import com.unict.dieei.psd.springexample.userservice.repository.ReactiveUserRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.ReactiveMongoOperations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    ReactiveUserRepository repository;

    @Autowired
    ReactiveMongoOperations operations;

    private void checkForCollection() {
        operations.collectionExists(User.class).flatMap(
                exists -> {
                    if (!exists)
                        operations.createCollection(User.class);
                    return Mono.just(true);
                }
        ).block();
    }

    @GetMapping("/")
    public Flux<User> getUsers() {
        return repository.findAll();
    }

    @RequestMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable("id") String id) {
        User u = repository.findBy_id(new ObjectId(id)).blockFirst();
        if (u == null) {
            return new ResponseEntity<>(u, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(u, HttpStatus.OK);
    }

    @RequestMapping("/{id}/exists")
    public @ResponseBody ResponseEntity<Boolean> exists(@PathVariable("id") String id) {
        Boolean ret = repository.existsById(new ObjectId(id)).block();
        return new ResponseEntity<>(ret, HttpStatus.OK);
    }


    @DeleteMapping("/{id}")
    public @ResponseBody ResponseEntity<Boolean> deleteUser(@PathVariable("id") String id) {

        boolean exists = exists(id).getBody();
        if (exists) {
            repository.deleteById(new ObjectId(id)).subscribe();
        } else
            return new ResponseEntity<>(false, HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(
                exists, HttpStatus.OK
        );
    }

    // TODO PUT

    @PostMapping(path="/", consumes={"application/JSON"}, produces="application/json")
    public Mono<User> createUser(@RequestBody User u) {
        return repository.save(u);
    }

}
