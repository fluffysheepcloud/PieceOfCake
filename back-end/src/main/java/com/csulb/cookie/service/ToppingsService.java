package com.csulb.cookie.service;

import com.csulb.cookie.domain.Toppings;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


public interface ToppingsService extends IService<Toppings> {

    Map<String, Object> updateToppingByID(Toppings tp);

    Map<String, Object> addToppingById(Toppings tp);
}
