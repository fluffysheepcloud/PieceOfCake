package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.BaseColor;
import com.csulb.cookie.service.BaseColorService;
import com.csulb.cookie.mapper.BaseColorMapper;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class BaseColorServiceImpl extends ServiceImpl<BaseColorMapper, BaseColor>
    implements BaseColorService{

    @Override
    public Map<String, Object> updateBaseColorByID(BaseColor bc) {
        if (bc == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        boolean res = this.updateById(bc);

        if (res) {
            bc = this.getById(bc.getId());
            return new ControllerResult(ControllerResult.SUCCESS, bc, "success").toJsonMap();
        }
        else return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }


}




