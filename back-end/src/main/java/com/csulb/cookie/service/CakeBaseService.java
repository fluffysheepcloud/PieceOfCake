package com.csulb.cookie.service;

import com.csulb.cookie.domain.CakeBase;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Options;

import java.util.Map;

public interface CakeBaseService extends IService<CakeBase> {

    @Options(useGeneratedKeys = true, keyProperty = "id")
    Map<String, Object> updateBaseSizeByID(CakeBase cb);
}
