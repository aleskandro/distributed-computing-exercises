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

    @GetMapping("/")
    public Flux<User> getUsers() {
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Mono<User>> getUser(@PathVariable("id") String id) {
        Mono<User> u = repository.findById(new ObjectId(id));
        if (u == null) {
            return new ResponseEntity<>(u, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(u, HttpStatus.OK);
    }

    @GetMapping("/{id}/exists")
    public @ResponseBody ResponseEntity<Mono<Boolean>> exists(@PathVariable("id") String id) {
        Mono<Boolean> ret = repository.existsById(new ObjectId(id));
        return new ResponseEntity<>(ret, HttpStatus.OK);
    }


    @DeleteMapping("/{id}")
    public @ResponseBody ResponseEntity<Boolean> deleteUser(@PathVariable("id") String id) {

        boolean exists = exists(id).getBody().block();
        if (exists) {
            repository.deleteById(new ObjectId(id)).subscribe();
        } else
            return new ResponseEntity<>(false, HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(
                true, HttpStatus.OK
        );
    }

    @PostMapping(path="/", consumes={"application/JSON"}, produces="application/json")
    public Mono<User> createUser(@RequestBody User u) {
        return repository.save(u);
    }

}
