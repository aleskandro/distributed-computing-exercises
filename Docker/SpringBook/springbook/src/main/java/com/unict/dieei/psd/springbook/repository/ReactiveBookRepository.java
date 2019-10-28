package com.unict.dieei.psd.springbook.repository;

import com.unict.dieei.psd.springbook.model.Book;
import org.bson.types.ObjectId;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import reactor.core.publisher.Flux;

public interface ReactiveBookRepository extends ReactiveCrudRepository<Book, ObjectId> {
}
