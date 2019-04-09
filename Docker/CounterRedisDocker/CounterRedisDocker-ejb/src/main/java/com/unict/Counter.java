/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unict;

import javax.ejb.Stateless;
import redis.clients.jedis.Jedis;

/**
 *
 * @author aleskandro
 */
@Stateless
public class Counter implements CounterLocal {

    @Override
    public String getCounterAndIncrement() {
        Jedis jedis = new Jedis("redis");
        jedis.incr("counter");
        return jedis.get("counter");
    }
}
