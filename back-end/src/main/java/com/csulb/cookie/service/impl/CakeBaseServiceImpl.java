package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.CakeBase;
import com.csulb.cookie.service.CakeBaseService;
import com.csulb.cookie.mapper.CakeBaseMapper;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CakeBaseServiceImpl extends ServiceImpl<CakeBaseMapper, CakeBase>
    implements CakeBaseService{

    @Override
    public Map<String, Object> updateBaseSizeByID(CakeBase cb) {

        if (cb == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        boolean res = this.updateById(cb);

        if (res) {
            cb = this.getById(cb.getId());
            return new ControllerResult(ControllerResult.SUCCESS, cb, "success").toJsonMap();
        }
        else return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }

    @Override
    public Map<String, Object> addBaseSizeById(CakeBase cb) {

        if (cb == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.save(cb);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, cb, "success").toJsonMap();
    }

    @Override
    public Map<String, Object> deleteBaseSizeById(Integer cbID) {
        if (cbID == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.removeById(cbID);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, null, "success").toJsonMap();
    }
}




