package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.domain.Favorite;
import com.csulb.cookie.service.FavoriteService;
import com.csulb.cookie.mapper.FavoriteMapper;
import org.springframework.stereotype.Service;

/**
* @author lding
* @description 针对表【favorite】的数据库操作Service实现
* @createDate 2022-04-27 19:28:00
*/
@Service
public class FavoriteServiceImpl extends ServiceImpl<FavoriteMapper, Favorite>
    implements FavoriteService{

}




