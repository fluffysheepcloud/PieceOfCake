package com.csulb.cookie.service;

import com.csulb.cookie.domain.Frosting;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


public interface FrostingService extends IService<Frosting> {

    Map<String, Object> updateFrostingColorByID(Frosting fc);

    Map<String, Object> addFrostingColorById(Frosting fc);
}
