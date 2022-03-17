package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;


@TableName(value ="frosting")
@Data
public class Frosting implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer mId;

    @TableField("frosting_color")
    private String name;

    @TableField("f_color_price")
    private Double price;

}