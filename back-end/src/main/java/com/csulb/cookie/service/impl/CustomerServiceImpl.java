package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.Customer;
import com.csulb.cookie.service.CustomerService;
import com.csulb.cookie.mapper.CustomerMapper;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements CustomerService {

    @Override
    public Map<String, Object> customerLogin(String username, String password) {

        return null;
    }
}




