package com.csulb.cookie.service;

import com.csulb.cookie.domain.Customer;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Options;

import java.util.Map;

public interface CustomerService extends IService<Customer> {

    @Override
    @Options(useGeneratedKeys = true, keyProperty = "id")
    default boolean save(Customer entity) {
        return IService.super.save(entity);
    }

    Map<String, Object> customerLogin(String username, String password);
    Map<String, Object> customerRegister(Customer customer);

    Map<String, Object> updateCustomerById(Customer c);
}
