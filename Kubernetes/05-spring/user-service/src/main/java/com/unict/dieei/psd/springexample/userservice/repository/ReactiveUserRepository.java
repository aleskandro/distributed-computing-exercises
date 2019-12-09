package com.unict.dieei.psd.springexample.userservice.repository;

import com.unict.dieei.psd.springexample.userservice.model.User;
import org.bson.types.ObjectId;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import reactor.core.publisher.Flux;

import java.util.List;

public interface ReactiveUserRepository extends ReactiveCrudRepository<User, ObjectId> {
    Flux<User> findBy_id(ObjectId _id);

    //boolean existsBy_id(ObjectId _id);

}
