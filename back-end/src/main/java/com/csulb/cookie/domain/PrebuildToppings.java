package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;


@TableName(value ="prebuild_toppings")
@Data
public class PrebuildToppings implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer prebuildId;

    private Integer toppingId;

}