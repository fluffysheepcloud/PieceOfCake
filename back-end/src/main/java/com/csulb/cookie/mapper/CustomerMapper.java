package com.csulb.cookie.mapper;

import com.csulb.cookie.domain.Customer;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csulb.cookie.domain.Merchant;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface CustomerMapper extends BaseMapper<Customer> {

}




