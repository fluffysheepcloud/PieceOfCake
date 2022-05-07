package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

@TableName(value ="favorite")
@Data
public class Favorite implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer customerId;

    private Integer prebuildId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}