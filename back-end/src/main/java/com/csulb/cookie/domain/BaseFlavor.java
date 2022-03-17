package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName base_flavor
 */
@TableName(value ="base_flavor")
@Data
public class BaseFlavor implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer mId;

    @TableField("flavor")
    private String name;

    @TableField("flavor_price")
    private Double price;

}