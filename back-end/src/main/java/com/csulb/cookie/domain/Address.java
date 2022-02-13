package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

@TableName(value ="address")
@Data
public class Address implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer merchantId;
    private String street;
    private String city;
    private String state;
    private Integer zip;

}