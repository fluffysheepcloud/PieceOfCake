package com.csulb.cookie.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.csulb.cookie.domain.Toppings;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PrebuildCakeBean {

    @TableField("id")
    private Integer id;

    private String cakeName;

    private Integer baseSize;

    @TableField("color")
    private String baseColor ;

    @TableField("flavor")
    private String baseFlavor;

    private String frostingColor;

    @TableField("f_flavor")
    private String frostingFlavor;

    private Double price;

//    @TableField(exist = false)
    private ArrayList<Toppings> toppings;

}
