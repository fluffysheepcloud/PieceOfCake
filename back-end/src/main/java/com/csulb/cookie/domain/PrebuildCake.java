package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@TableName(value ="prebuild_cake")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PrebuildCake implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    @TableField("m_id")
    private Integer merchantId;

    private String cakeName;

    @TableField("base_id")
    private Integer baseSizeId;

    private Integer baseColorId;

    private Integer baseFlavorId;

    private Integer frostingColorId;

    private Integer frostingFlavorId;

    private Double price;

    @TableField(exist = false)
    private ArrayList<Integer> toppingIds;

}