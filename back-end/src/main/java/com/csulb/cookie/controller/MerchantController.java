/*
Contributed by Sydney
 */

package com.csulb.cookie.controller;

import com.csulb.cookie.domain.Merchant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

// I think we will need a repository class... Will add later

@Controller
public class MerchantController {

    @PostMapping("/addMerchant")
    public Merchant merchant(@RequestParam int id,
                             @RequestParam String username,
                             @RequestParam String shop_name,
                             @RequestParam String password,
                             @RequestParam String email,
                             @RequestParam String phone,
                             @RequestParam String description,
                             @RequestParam String business_hour) {
        Merchant m = new Merchant();
        m.setId(id);
        m.setUsername(username);
        m.setShopName(shop_name);
        m.setPassword(password);
        m.setEmail(email);
        m.setPhone(phone);
        m.setDescription(description);
        m.setBusiness_hour(business_hour);
        return m;
    }
}
