package com.csulb.cookie.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Review {

    @TableField("placedDate")
    private Long orderNumber;
    private String comment;
    private Double rate;

}
