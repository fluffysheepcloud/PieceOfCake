package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;


@TableName(value ="toppings")
@Data
public class Toppings implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer mId;

    @TableField("topping_name")
    private String name;

    @TableField("topping_price")
    private Double price;
}