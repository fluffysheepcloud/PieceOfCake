package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.Address;
import com.csulb.cookie.service.AddressService;
import com.csulb.cookie.mapper.AddressMapper;
import org.springframework.stereotype.Service;

/**
* @author lding
* @description 针对表【address】的数据库操作Service实现
* @createDate 2022-02-12 11:28:00
*/
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address>
    implements AddressService{

}




