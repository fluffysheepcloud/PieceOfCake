/*
Contributed by Sydney
 */

package com.csulb.cookie.controller;

import com.csulb.cookie.domain.Merchant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MerchantController {

    @RequestMapping("/merchant")
    @ResponseBody
    public Merchant merchant() {
        Merchant m = new Merchant();
        return m;
    }
}
