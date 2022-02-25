package com.csulb.cookie.service;

import com.csulb.cookie.domain.Order;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

public interface OrderService extends IService<Order> {

    Map<String, Object> pureCake(String name, String phone, String email, String des);
}
