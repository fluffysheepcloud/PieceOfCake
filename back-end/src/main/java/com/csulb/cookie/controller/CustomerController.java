/*
Contributed by Sydney
 */

package com.csulb.cookie.controller;

import com.csulb.cookie.domain.Customer;
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

    @ResponseBody
    @RequestMapping(value = "/api/customer/register", method = RequestMethod.POST)
    public Map<String, Object> customerRegister(Customer customer) {
        return service.customerRegister(customer);
    }

    @ResponseBody
    @RequestMapping(value = "/api/customer", method = RequestMethod.PUT)
    public Map<String, Object> updateCustomerById(Customer c) {
        return service.updateCustomerById(c);
    }

    @ResponseBody
    @RequestMapping(value = "/api/customer/reviewed/{id}", method = RequestMethod.GET)
    public Map<String, Object> getReviewedOrders(@PathVariable("id") Integer id) {
        return service.getReviewedOrders(id);
    }

    @ResponseBody
    @RequestMapping(value = "/api/customer/unreviewed/{id}", method = RequestMethod.GET)
    public Map<String, Object> getUnreviewedOrders(@PathVariable("id") Integer id) {
        return service.getUnreviewedOrders(id);
    }

    @ResponseBody
    @RequestMapping(value = "/api/customer/add_fav_cake", method = RequestMethod.POST)
    public Map<String, Object> addFavoriteCake(Integer cId, Integer pId) {
        return null;
    }


    @Autowired
    public void setService(CustomerService service) { this.service = service; }
}
