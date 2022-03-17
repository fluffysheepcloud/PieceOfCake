package com.csulb.cookie.controller;

import com.csulb.cookie.domain.Merchant;
import com.csulb.cookie.service.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class MerchantController {


    MerchantService service;


    @ResponseBody
    @RequestMapping(value = "/api/merchant/login", method = RequestMethod.POST)
    public Map<String, Object> merchantLogin(String username, String password) {
        return service.merchantLogin(username, password);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/register", method = RequestMethod.POST)
    public Map<String, Object> customerRegister(Merchant merchant) {
        return service.merchantRegister(merchant);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/{id}", method = RequestMethod.GET)
    public Map<String, Object> getMerchantById(@PathVariable(value = "id") Integer id) {
        return service.getMerchantById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant", method = RequestMethod.PUT)
    public Map<String, Object> updateMerchantById(Merchant m) {
        return service.updateMerchantById(m);
    }


    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/{id}", method = RequestMethod.GET)
    public Map<String, Object> getMerchantCapability(@PathVariable(value = "id") int id) {
        return service.getMerchantCapability(id);
    }



    @Autowired
    public void setService(MerchantService service) {
        this.service = service;
    }
}
