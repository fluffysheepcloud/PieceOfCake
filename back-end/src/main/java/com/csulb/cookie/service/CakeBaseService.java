package com.csulb.cookie.service;

import com.csulb.cookie.domain.BaseColor;
import com.csulb.cookie.domain.CakeBase;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Options;

import java.util.Map;

public interface CakeBaseService extends IService<CakeBase> {

    Map<String, Object> updateBaseSizeByID(CakeBase cb);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    Map<String, Object> addBaseSizeById(CakeBase cb);
}
