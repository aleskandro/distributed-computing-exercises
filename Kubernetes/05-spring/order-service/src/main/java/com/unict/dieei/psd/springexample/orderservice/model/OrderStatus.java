package com.unict.dieei.psd.springexample.orderservice.model;

import java.io.Serializable;

public enum OrderStatus implements Serializable {
    PENDING,
    CONFIRMED,
    DELETED
}
