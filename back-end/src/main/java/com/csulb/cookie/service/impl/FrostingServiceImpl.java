package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.Frosting;
import com.csulb.cookie.service.FrostingService;
import com.csulb.cookie.mapper.FrostingMapper;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
public class FrostingServiceImpl extends ServiceImpl<FrostingMapper, Frosting>
    implements FrostingService{

    @Override
    public Map<String, Object> updateFrostingColorByID(Frosting fc) {
        if (fc == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        boolean res = this.updateById(fc);

        if (res) {
            fc = this.getById(fc.getId());
            return new ControllerResult(ControllerResult.SUCCESS, fc, "success").toJsonMap();
        }
        else return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();

    }

    @Override
    public Map<String, Object> addFrostingColorById(Frosting fc) {
        if (fc == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.save(fc);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, fc, "success").toJsonMap();
    }

    @Override
    public Map<String, Object> deleteBaseFlavorById(Integer fcID) {
        if (fcID == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.removeById(fcID);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, null, "success").toJsonMap();
    }
}




