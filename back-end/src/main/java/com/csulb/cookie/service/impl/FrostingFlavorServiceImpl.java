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
}




