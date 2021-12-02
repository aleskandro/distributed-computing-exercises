package com.unict.dsbd.book_manager.router;

import com.unict.dsbd.book_manager.controller.BookController;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

@Configuration
public class BookRouter {

    @Bean
    public RouterFunction<ServerResponse> bookRoutes(BookController bc) {
        return RouterFunctions.route(
                RequestPredicates.GET("/books"), bc::getBooks
        ).andRoute(
                RequestPredicates.GET("/books/{id}"), bc::getBook
        ).andRoute(
                RequestPredicates.POST("/books2").and(
                        RequestPredicates.accept(MediaType.APPLICATION_JSON)),
                bc::saveBook
        );
    }
}
