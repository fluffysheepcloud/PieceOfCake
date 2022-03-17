package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;


@TableName(value ="frosting_flavor")
@Data
public class FrostingFlavor implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer mId;

    @TableField("f_flavor")
    private String name;

    @TableField("f_flavor_price")
    private Double price;

}