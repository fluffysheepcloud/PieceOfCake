package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.BaseFlavor;
import com.csulb.cookie.service.BaseFlavorService;
import com.csulb.cookie.mapper.BaseFlavorMapper;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
public class BaseFlavorServiceImpl extends ServiceImpl<BaseFlavorMapper, BaseFlavor>
    implements BaseFlavorService{

    @Override
    public Map<String, Object> updateBaseFlavorByID(BaseFlavor bf) {
        if (bf == null) return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();

        boolean res = this.updateById(bf);

        if (res) {
            bf = this.getById(bf.getId());
            return new ControllerResult(ControllerResult.SUCCESS, bf, "success").toJsonMap();
        }
        else return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();

    }

    @Override
    public Map<String, Object> addBaseFlavorById(BaseFlavor bf) {
        if (bf == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.save(bf);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, bf, "success").toJsonMap();

    }

    @Override
    public Map<String, Object> deleteBaseFlavorById(Integer bfID) {
        if (bfID == null) return new ControllerResult(ControllerResult.FORBIDDEN, null, "not allowed").toJsonMap();

        boolean res = this.removeById(bfID);
        if (!res) return new ControllerResult(ControllerResult.ERROR, null, "ERROR").toJsonMap();

        return new ControllerResult(ControllerResult.SUCCESS, null, "success").toJsonMap();
    }

}




