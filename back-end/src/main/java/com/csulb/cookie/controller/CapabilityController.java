package com.csulb.cookie.controller;

import com.csulb.cookie.domain.*;
import com.csulb.cookie.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class CapabilityController {

    CakeBaseService cbService;
    BaseColorService bcService;
    BaseFlavorService bfService;
    FrostingService fcService;
    FrostingFlavorService ffService;
    ToppingsService tpService;


    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/cake_base", method = RequestMethod.PUT)
    public Map<String, Object> updateBaseSizeByID(CakeBase cb) {
        return cbService.updateBaseSizeByID(cb);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/base_color", method = RequestMethod.PUT)
    public Map<String, Object> updateBaseColorByID(BaseColor bc) {
        return bcService.updateBaseColorByID(bc);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/base_flavor", method = RequestMethod.PUT)
    public Map<String, Object> updateBaseFlavorByID(BaseFlavor bf) {
        return bfService.updateBaseFlavorByID(bf);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/frosting_color", method = RequestMethod.PUT)
    public Map<String, Object> updateFrostingColorByID(Frosting fc) {
        return fcService.updateFrostingColorByID(fc);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/frosting_flavor", method = RequestMethod.PUT)
    public Map<String, Object> updateFrostingFlavorByID(FrostingFlavor ff) {
        return ffService.updateFrostingFlavorByID(ff);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/topping", method = RequestMethod.PUT)
    public Map<String, Object> updateToppingByID(Toppings tp) {
        return tpService.updateToppingByID(tp);
    }

    @ResponseBody

    @RequestMapping(value = "/api/merchant/capability/cake_base", method = RequestMethod.POST)
    public Map<String, Object> addBaseSizeById(CakeBase cb) {
       return cbService.addBaseSizeById(cb);
    }


    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/base_color", method = RequestMethod.POST)
    public Map<String, Object> addBaseColorById(BaseColor bc) {
        return bcService.addBaseColorById(bc);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/base_flavor", method = RequestMethod.POST)
    public Map<String, Object> addBaseFlavorById(BaseFlavor bf) {
        return bfService.addBaseFlavorById(bf);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/frosting_color", method = RequestMethod.POST)
    public Map<String, Object> addFrostingColorById(Frosting fc) {
        return fcService.addFrostingColorById(fc);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/frosting_flavor", method = RequestMethod.POST)
    public Map<String, Object> addFrostingFlavorById(FrostingFlavor ff) {
        return ffService.addFrostingFlavorById(ff);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/topping", method = RequestMethod.POST)
    public Map<String, Object> addToppingById(Toppings tp) {
        return tpService.addToppingById(tp);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/cake_base/{id}", method = RequestMethod.DELETE)
    public Map<String, Object> deleteBaseSizeById(@PathVariable("id") Integer cbID) {
        return cbService.deleteBaseSizeById(cbID);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/base_color/{id}", method = RequestMethod.DELETE)
    public Map<String, Object> deleteBaseColorById(@PathVariable("id") Integer bcID) {
        return bcService.deleteBaseColorById(bcID);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/base_flavor/{id}", method = RequestMethod.DELETE)
    public Map<String, Object> deleteBaseFlavorById(@PathVariable("id") Integer bfID) {
        return bfService.deleteBaseFlavorById(bfID);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/frosting_color/{id}", method = RequestMethod.DELETE)
    public Map<String, Object> deleteFrostingColorById(@PathVariable("id") Integer fcID) {
        return fcService.deleteBaseFlavorById(fcID);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/frosting_flavor/{id}", method = RequestMethod.DELETE)
    public Map<String, Object> deleteFrostingFlavorById(@PathVariable("id") Integer ffID) {
        return ffService.deleteBaseFlavorById(ffID);
    }

    @ResponseBody
    @RequestMapping(value = "/api/merchant/capability/topping/{id}", method = RequestMethod.DELETE)
    public Map<String, Object> deleteToppingById(@PathVariable("id") Integer tpID) {
        return tpService.deleteBaseFlavorById(tpID);
    }



    @Autowired
    public void setService(CakeBaseService service) { this.cbService = service; }
    @Autowired
    public void setFfService(FrostingFlavorService ffService) {
        this.ffService = ffService;
    }
    @Autowired
    public void setFcService(FrostingService fcService) {
        this.fcService = fcService;
    }
    @Autowired
    public void setCbService(CakeBaseService cbService) {
        this.cbService = cbService;
    }
    @Autowired
    public void setBfService(BaseFlavorService bfService) {
        this.bfService = bfService;
    }
    @Autowired
    public void setBcService(BaseColorService bcService) {
        this.bcService = bcService;
    }
    @Autowired
    public void setTpService(ToppingsService tpService) { this.tpService = tpService; }
}
