package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.Frosting;
import com.csulb.cookie.service.FrostingService;
import com.csulb.cookie.mapper.FrostingMapper;
import org.springframework.stereotype.Service;


@Service
public class FrostingServiceImpl extends ServiceImpl<FrostingMapper, Frosting>
    implements FrostingService{

}




