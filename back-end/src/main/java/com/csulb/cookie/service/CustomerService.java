package com.csulb.cookie.service;

import com.csulb.cookie.domain.Customer;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

public interface CustomerService extends IService<Customer> {
    Map<String, Object> customerLogin(String username, String password);
}
