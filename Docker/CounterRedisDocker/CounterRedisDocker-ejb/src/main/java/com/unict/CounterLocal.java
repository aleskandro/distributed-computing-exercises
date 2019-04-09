/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unict;

import javax.ejb.Local;

/**
 *
 * @author aleskandro
 */
@Local
public interface CounterLocal {
    public String getCounterAndIncrement();
}
