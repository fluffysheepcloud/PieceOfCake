package com.csulb.cookie.service;

import com.csulb.cookie.bean.Capability;
import com.csulb.cookie.domain.Customer;
import com.csulb.cookie.domain.Merchant;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Options;

import java.util.Map;

public interface MerchantService extends IService<Merchant> {

    @Override
    @Options(useGeneratedKeys = true, keyProperty = "id")
    default boolean save(Merchant entity) {
        return IService.super.save(entity);
    }

    Map<String, Object> merchantLogin(String username, String password);

    Map<String, Object> merchantRegister(Merchant customer);

    Map<String, Object> getMerchantById(int id);

    Map<String, Object> updateMerchantById(Merchant m);

    Map<String, Object> getMerchantCapability(int id);
}
