package com.unict.dieei.psd.springexample.userservice.repository;

import com.unict.dieei.psd.springexample.userservice.model.User;
import org.bson.types.ObjectId;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;

public interface ReactiveUserRepository extends ReactiveCrudRepository<User, ObjectId> {
}
