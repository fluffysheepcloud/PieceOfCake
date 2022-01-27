/*
Contributed by Sydney
 */

package com.csulb.cookie.controller;

import com.csulb.cookie.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class CustomerController {

    CustomerService service;

    @ResponseBody
    @RequestMapping(value = "/api/customer/login", method = RequestMethod.POST)
    public Map<String, Object> customerLogin(String username, String password) {
        return service.customerLogin(username, password);
    }

    @Autowired
    public void setService(CustomerService service) { this.service = service; }
}
