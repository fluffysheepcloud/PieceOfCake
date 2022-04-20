package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.bean.PrebuildCakeBean;
import com.csulb.cookie.domain.PrebuildCake;
import com.csulb.cookie.domain.PrebuildToppings;
import com.csulb.cookie.service.PrebuildCakeService;
import com.csulb.cookie.mapper.PrebuildCakeMapper;
import com.csulb.cookie.service.PrebuildToppingsService;
import com.csulb.cookie.service.ToppingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class PrebuildCakeServiceImpl extends ServiceImpl<PrebuildCakeMapper, PrebuildCake>
    implements PrebuildCakeService{

    PrebuildToppingsService prebuildToppingsService;



    @Override
    public Map<String, Object> getAllPrebuildCakes(Integer id) {
        if (id == null) returnNull();
        List<PrebuildCakeBean> cakes = getBaseMapper().getPrebuildCakesById(id);
        if (cakes == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, cakes, "success").toJsonMap();
    }

    @Override
    public Map<String, Object> getOneById(Integer pId) {
        if (pId == null) return returnNull();
        PrebuildCakeBean cake = getBaseMapper().getOneCakeById(pId);
        if (cake == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, cake, "success").toJsonMap();
    }

    @Override
    public Map<String, Object> addPrebuildCake(PrebuildCake cake) {
        if (cake == null) return returnNull();
        // save prebuild cake and get prebuild cake id
        boolean res = this.save(cake);
        if (!res) return returnError();
        // get prebuild cake toppings
        ArrayList<Integer> toppings = cake.getToppingIds();
        ArrayList<PrebuildToppings> tpList = new ArrayList<>();
        for (Integer i : toppings) {
            PrebuildToppings pt = new PrebuildToppings();
            pt.setPrebuildId(cake.getId());
            pt.setToppingId(i);
            tpList.add(pt);
        }
        boolean toppingsRes = prebuildToppingsService.saveBatch(tpList, tpList.size());
        if (!toppingsRes) return returnError();

        return new ControllerResult(ControllerResult.SUCCESS, cake, "success").toJsonMap();
    }

    public Map<String, Object> returnError () {
        return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }

    public Map<String, Object> returnNull () {
        return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad request").toJsonMap();
    }

    @Autowired
    public void setPrebuildToppingsService(PrebuildToppingsService prebuildToppingsService) {
        this.prebuildToppingsService = prebuildToppingsService;
    }

}




