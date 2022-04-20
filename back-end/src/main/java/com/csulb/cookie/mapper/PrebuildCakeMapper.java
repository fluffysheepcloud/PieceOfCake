package com.csulb.cookie.mapper;

import com.csulb.cookie.bean.PrebuildCakeBean;
import com.csulb.cookie.bean.PrebuildCakeParam;
import com.csulb.cookie.domain.PrebuildCake;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface PrebuildCakeMapper extends BaseMapper<PrebuildCake> {

    List<PrebuildCakeBean> getPrebuildCakesById(Integer id);
    PrebuildCakeBean getOneCakeById(Integer pId);

//    @Options(useGeneratedKeys = true, keyProperty = "id")
//    Integer addPrebuildCake(PrebuildCakeParam param);
}




