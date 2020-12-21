package com.unict.dsbd.book_manager.controller;

import ch.qos.logback.classic.Level;
import com.unict.dsbd.book_manager.models.Book;
import com.unict.dsbd.book_manager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import java.util.logging.Logger;

@Component
public class BookController {

    @Autowired
    BookService svc;

    final static Mono<ServerResponse> notFound = ServerResponse.notFound().build();
    final static Mono<ServerResponse> badRequest = ServerResponse.badRequest().build();

    /**
     * Route: /books/{id}
     *
     * @param req
     * @return
     */
    public Mono<ServerResponse> getBook(ServerRequest req) {
        String sid = req.pathVariable("id");
        System.out.println(sid);
        return ServerResponse.ok().contentType(MediaType.APPLICATION_JSON).body(
                svc.findById(sid), Book.class
        );
    }

    public Mono<ServerResponse> saveBook(ServerRequest req) {
        return ServerResponse.ok().contentType(MediaType.APPLICATION_JSON).
                body(req.bodyToMono(Book.class).
                flatMap(b -> svc.save(b)), Book.class);
    }

    public Mono<ServerResponse> getBooks(ServerRequest req) {
        return ServerResponse.ok().contentType(MediaType.APPLICATION_JSON).body(
                svc.findAll(), Book.class
        );
    }
}
