package com.csulb.cookie.controller;

import com.csulb.cookie.domain.CakeBase;
import com.csulb.cookie.service.CakeBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class CapabilityController {

    CakeBaseService service;

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/cake_base", method = RequestMethod.PUT)
    public Map<String, Object> updateBaseSizeByID(CakeBase cb) {
        return service.updateBaseSizeByID(cb);
    }



    @Autowired
    public void setService(CakeBaseService service) { this.service = service; }
}
