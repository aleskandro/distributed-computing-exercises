package com.unict.dieei.psd.springexample.orderservice.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonGetter;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Order {
    @Id
    private ObjectId _id;
    private String description;
    private ObjectId user;
    private OrderStatus status;

    @JsonCreator
    public Order(String description, ObjectId user) {
        this.description = description;
        this.user = user;
        this._id = new ObjectId();
        this.status = OrderStatus.PENDING;
    }

    public ObjectId get_id() {
        return _id;
    }

    public void set_id(ObjectId _id) {
        this._id = _id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ObjectId getUser() {
        return user;
    }

    public void setUser(ObjectId user) {
        this.user = user;
    }

    @JsonGetter("_id")
    public String get_id_string() {
        return _id.toHexString();
    }

    @JsonGetter("user")
    public String get_user_string() {
        return user.toHexString();
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    /*public Integer getStatusInt() {
        return status.ordinal();
    }*/
}
