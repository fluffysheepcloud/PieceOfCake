package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.Toppings;
import com.csulb.cookie.service.ToppingsService;
import com.csulb.cookie.mapper.ToppingsMapper;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
public class ToppingsServiceImpl extends ServiceImpl<ToppingsMapper, Toppings>
    implements ToppingsService{

    @Override
    public Map<String, Object> updateToppingByID(Toppings tp) {
        if (tp == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        boolean res = this.updateById(tp);

        if (res) {
            tp = this.getById(tp.getId());
            return new ControllerResult(ControllerResult.SUCCESS, tp, "success").toJsonMap();
        }
        else return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();

    }
}




