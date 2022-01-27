package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

@TableName(value ="customer")
@Data
public class Customer implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String username;
    private String nickName;
    private String password;
    private String email;
    private String phone;

}