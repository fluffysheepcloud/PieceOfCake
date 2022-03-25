package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.FrostingFlavor;
import com.csulb.cookie.service.FrostingFlavorService;
import com.csulb.cookie.mapper.FrostingFlavorMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Map;

@Component
@Service
public class FrostingFlavorServiceImpl extends ServiceImpl<FrostingFlavorMapper, FrostingFlavor>
    implements FrostingFlavorService{

    @Override
    public Map<String, Object> updateFrostingFlavorByID(FrostingFlavor ff) {
        if (ff == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        boolean res = this.updateById(ff);

        if (res) {
            ff = this.getById(ff.getId());
            return new ControllerResult(ControllerResult.SUCCESS, ff, "success").toJsonMap();
        }
        else return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();

    }

    @Override
    public Map<String, Object> addFrostingFlavorById(FrostingFlavor ff) {
        if (ff == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.save(ff);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, ff, "success").toJsonMap();

    }

    @Override
    public Map<String, Object> deleteBaseFlavorById(Integer ffID) {
        if (ffID == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.removeById(ffID);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, null, "success").toJsonMap();
    }
}




