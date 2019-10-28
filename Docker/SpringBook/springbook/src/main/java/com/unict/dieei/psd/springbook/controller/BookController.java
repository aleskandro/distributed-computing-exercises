package com.unict.dieei.psd.springbook.controller;

import com.unict.dieei.psd.springbook.model.Book;
import com.unict.dieei.psd.springbook.repository.ReactiveBookRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
public class BookController {

    @Autowired
    ReactiveBookRepository repository;

    @GetMapping("/")
    public Flux<Book> getBooks() {
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public Mono<Book> getBook(@PathVariable String id) {
        return repository.findById(new ObjectId(id));
    }

    @PostMapping(path="/", consumes="application/JSON")
    public Mono<Book> newBook(@RequestBody Book b) {
        return repository.save(b);
    }

    public boolean exists(String id) {
        return repository.existsById(new ObjectId(id)).block();
    }

    @DeleteMapping("/{id}")
    public @ResponseBody ResponseEntity<Boolean> deleteBook(@PathVariable String id) {
        Boolean exists = exists(id);
        if (exists) {
            repository.deleteById(new ObjectId(id)).subscribe();
        } else
            return new ResponseEntity<>(false, HttpStatus.NOT_FOUND);

        return new ResponseEntity<>(true, HttpStatus.OK);

    }

    @PutMapping(path = "/{id}", consumes = "application/JSON")
    public @ResponseBody ResponseEntity<Mono<Book>> updateBook(@RequestBody Book b, @PathVariable String id) {
        if (!exists(id)) {
            return new ResponseEntity<>(Mono.empty(), HttpStatus.NOT_FOUND);
        }
        b.set_id(new ObjectId(id));
        return new ResponseEntity<>(repository.save(b), HttpStatus.OK);
    }

}
