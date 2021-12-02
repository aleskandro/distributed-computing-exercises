package com.unict.dsbd.book_manager.repository;

import com.unict.dsbd.book_manager.models.Book;
import org.bson.types.ObjectId;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;

public interface BookRepository extends ReactiveCrudRepository<Book, ObjectId> {
}
