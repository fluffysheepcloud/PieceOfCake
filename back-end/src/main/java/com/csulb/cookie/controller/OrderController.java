package com.csulb.cookie.controller;

import com.csulb.cookie.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class OrderController {

    OrderService service;

    @ResponseBody
    @RequestMapping(value = "/api/order/pure_cake")
    public Map<String, Object> pureCake(String cId, String mId, String name, String phone, String email, String des) {
        return service.pureCake(name, phone, email, des);
    }



    @Autowired
    public void setService(OrderService service) {
        this.service = service;
    }
}
