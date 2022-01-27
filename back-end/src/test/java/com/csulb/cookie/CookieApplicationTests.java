package com.csulb.cookie;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;


class CookieApplicationTests {

    @Test
    void contextLoads() {
        String s = "Indianapolis";
        System.out.println(s.substring(2, s.length() - 2));
    }

}
