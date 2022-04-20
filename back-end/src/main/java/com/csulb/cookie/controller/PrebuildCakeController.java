package com.csulb.cookie.controller;
import com.csulb.cookie.domain.PrebuildCake;
import com.csulb.cookie.service.PrebuildCakeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class PrebuildCakeController {

    PrebuildCakeService service;


    @ResponseBody
    @RequestMapping(value = "/api/prebuild/{id}", method = RequestMethod.GET)
    public Map<String, Object> getAllPrebuildCakes(@PathVariable("id") Integer id) {
        return service.getAllPrebuildCakes(id);
    }

    @ResponseBody
    @RequestMapping(value = "/api/prebuild_cake/{id}", method = RequestMethod.GET)
    public Map<String, Object> getOneById(@PathVariable("id") Integer pId) {
        return service.getOneById(pId);
    }


    @ResponseBody
    @RequestMapping(value = "/api/prebuild_cake", method = RequestMethod.POST)
    public Map<String, Object> addPrebuildCake(@RequestBody PrebuildCake cake) {
        System.out.println(cake);
        return service.addPrebuildCake(cake);
//        return null;
    }

    @Autowired
    public void setService(PrebuildCakeService service) {
        this.service = service;
    }
}
