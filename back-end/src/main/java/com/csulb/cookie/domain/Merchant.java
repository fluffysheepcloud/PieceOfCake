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
    private String shopName;
    private String password;
    private String email;
    private String phone;
    private String description;
    private String businessHour;

}