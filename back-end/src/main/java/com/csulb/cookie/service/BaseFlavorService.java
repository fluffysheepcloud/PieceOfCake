package com.csulb.cookie.service;

import com.csulb.cookie.domain.BaseFlavor;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


public interface BaseFlavorService extends IService<BaseFlavor> {

    Map<String, Object> updateBaseFlavorByID(BaseFlavor bf);
}
