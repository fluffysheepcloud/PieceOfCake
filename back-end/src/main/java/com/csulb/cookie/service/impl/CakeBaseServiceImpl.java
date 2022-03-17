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
}




