package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

@TableName(value ="merchant")
@Data
public class Merchant implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String shopName;
    private String description;
    private String businessHour;

    @TableField(exist = false)
    private String street;

    @TableField(exist = false)
    private String city;

    @TableField(exist = false)
    private String state;

    @TableField(exist = false)
    private Integer zip;


}