package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.Order;
import com.csulb.cookie.service.OrderService;
import com.csulb.cookie.mapper.OrderMapper;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order>
    implements OrderService{

    @Override
    public Map<String, Object> pureCake(String name, String phone, String email, String des) {
        return null;
    }
}




