package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;


@TableName(value ="cake_base")
@Data
public class CakeBase implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer mId;

    @TableField("base_size")
    private Integer name;

    @TableField("base_price")
    private Double price;

}