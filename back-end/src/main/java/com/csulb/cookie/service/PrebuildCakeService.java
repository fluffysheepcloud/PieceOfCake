package com.csulb.cookie.service;

import com.csulb.cookie.bean.PrebuildCakeParam;
import com.csulb.cookie.domain.PrebuildCake;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


public interface PrebuildCakeService extends IService<PrebuildCake> {

    Map<String, Object> getAllPrebuildCakes(Integer id);

    Map<String, Object> getOneById(Integer pId);

    Map<String, Object> addPrebuildCake(PrebuildCake cake);
}
