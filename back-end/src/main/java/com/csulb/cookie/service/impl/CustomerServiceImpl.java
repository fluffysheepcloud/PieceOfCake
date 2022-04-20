package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.bean.Review;
import com.csulb.cookie.domain.Customer;
import com.csulb.cookie.service.CustomerService;
import com.csulb.cookie.mapper.CustomerMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Log4j2
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements CustomerService {

    @Override
    public Map<String, Object> customerLogin(String username, String password) {
        if (username == null || password == null) {
            return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad reqeust").toJsonMap();
        }

        QueryWrapper<Customer> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        Customer c = getBaseMapper().selectOne(wrapper);
        if (c != null && c.getPassword() != null) {
            if (c.getPassword().equals(password))
                return new ControllerResult(ControllerResult.SUCCESS, c, "success").toJsonMap();
            else
                return new ControllerResult(ControllerResult.UNLOGIN, null, "fail").toJsonMap();

        }

        return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();
    }

    @Override
    public Map<String, Object> customerRegister(Customer customer) {
        // make sure all attributes are not null
        if (customer.getUsername() == null ||
            customer.getPassword() == null ||
            customer.getEmail() == null ||
            customer.getPhone() == null
        ) {
            return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad request").toJsonMap();
        }

        customer.setNickName(customer.getUsername());
        boolean res = save(customer);

        return res ?
                new ControllerResult(ControllerResult.SUCCESS, customer, "success").toJsonMap() :
                new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }

    @Override
    public Map<String, Object> updateCustomerById(Customer c) {
        boolean res = updateById(c);

        return res ?
            new ControllerResult(ControllerResult.SUCCESS, c, "success").toJsonMap() :
            new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }

    @Override
    public Map<String, Object> getReviewedOrders(Integer id) {
        if (id == null) return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad request").toJsonMap();
        List<Review> orders = this.getBaseMapper().getReviewedOrders(id);
        System.out.println(orders);
        return new ControllerResult(ControllerResult.SUCCESS, orders, "success").toJsonMap();
    }

    @Override
    public Map<String, Object> getUnreviewedOrders(Integer id) {
        if (id == null) return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad request").toJsonMap();
        List<Review> orders = this.getBaseMapper().getUnreviewedOrders(id);
        return new ControllerResult(ControllerResult.SUCCESS, orders, "success").toJsonMap();
    }


}




