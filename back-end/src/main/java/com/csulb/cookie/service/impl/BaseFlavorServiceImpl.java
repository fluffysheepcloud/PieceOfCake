package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.BaseFlavor;
import com.csulb.cookie.service.BaseFlavorService;
import com.csulb.cookie.mapper.BaseFlavorMapper;
import org.springframework.stereotype.Service;


@Service
public class BaseFlavorServiceImpl extends ServiceImpl<BaseFlavorMapper, BaseFlavor>
    implements BaseFlavorService{

}




