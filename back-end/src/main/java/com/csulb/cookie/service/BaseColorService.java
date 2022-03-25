package com.csulb.cookie.service;

import com.csulb.cookie.domain.BaseColor;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


public interface BaseColorService extends IService<BaseColor> {

    Map<String, Object> updateBaseColorByID(BaseColor bc);

    Map<String, Object> addBaseColorById(BaseColor bc);
}
