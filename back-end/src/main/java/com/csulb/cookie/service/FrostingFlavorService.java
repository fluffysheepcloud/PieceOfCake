package com.csulb.cookie.service;

import com.csulb.cookie.domain.FrostingFlavor;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


public interface FrostingFlavorService extends IService<FrostingFlavor> {

    Map<String, Object> updateFrostingFlavorByID(FrostingFlavor ff);

    Map<String, Object> addFrostingFlavorById(FrostingFlavor ff);
}
