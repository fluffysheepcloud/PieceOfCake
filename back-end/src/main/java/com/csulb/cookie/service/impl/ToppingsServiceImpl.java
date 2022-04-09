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

    @Override
    public Map<String, Object> addToppingById(Toppings tp) {
        if (tp == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.save(tp);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, tp, "success").toJsonMap();

    }

    @Override
    public Map<String, Object> deleteBaseFlavorById(Integer tpID) {
        if (tpID == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.removeById(tpID);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, null, "success").toJsonMap();
    }
}




