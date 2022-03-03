package com.csulb.cookie.mapper;

import com.csulb.cookie.domain.Merchant;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Map;

public interface MerchantMapper extends BaseMapper<Merchant> {

    int updateMerchantById(Merchant m);

}




