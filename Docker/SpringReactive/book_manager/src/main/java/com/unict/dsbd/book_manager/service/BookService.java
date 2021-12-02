package com.unict.dsbd.book_manager.service;

import com.unict.dsbd.book_manager.models.Book;
import com.unict.dsbd.book_manager.repository.BookRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class BookService {

    @Autowired
    BookRepository repo;

    public Mono<Book> findById(String id) {
        Mono<Book> book = repo.findById(new ObjectId(id));
        book.subscribe((v) -> {
            Logger.getGlobal().log(Level.INFO, "Book found");
        });
        return book;

    }

    public Mono<Book> save(Book b) {
        Mono<Book> book = repo.save(b);
        return book;
    }

    public Flux<Book> findAll() {
        Flux<Book> books = repo.findAll();
        return books;
    }
}
