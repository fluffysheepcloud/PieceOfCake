package com.csulb.cookie.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    private int id;
    private String username;
    private String nickName;
    private String password;
    private String email;
    private String phone;
}
