package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.FrostingFlavor;
import com.csulb.cookie.service.FrostingFlavorService;
import com.csulb.cookie.mapper.FrostingFlavorMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
@Service
public class FrostingFlavorServiceImpl extends ServiceImpl<FrostingFlavorMapper, FrostingFlavor>
    implements FrostingFlavorService{

}




