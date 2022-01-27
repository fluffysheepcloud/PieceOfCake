/*
Contributed by Sydney
 */

package com.csulb.cookie.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Merchant {
    private int id;
    private String username;
    private String shopName;
    private String password;
    private String email;
    private String phone;
    private String description;
    private String business_hour;
}
