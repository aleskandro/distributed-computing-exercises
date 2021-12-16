package com.unict.dieei.psd.springexample.orderservice.repository;

import com.unict.dieei.psd.springexample.orderservice.model.Order;
import org.bson.types.ObjectId;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import reactor.core.publisher.Flux;

public interface ReactiveOrderRepository extends ReactiveCrudRepository<Order, ObjectId> {
}
