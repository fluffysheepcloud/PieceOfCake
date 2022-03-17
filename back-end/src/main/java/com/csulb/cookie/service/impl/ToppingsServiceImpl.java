package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.Toppings;
import com.csulb.cookie.service.ToppingsService;
import com.csulb.cookie.mapper.ToppingsMapper;
import org.springframework.stereotype.Service;


@Service
public class ToppingsServiceImpl extends ServiceImpl<ToppingsMapper, Toppings>
    implements ToppingsService{

}




