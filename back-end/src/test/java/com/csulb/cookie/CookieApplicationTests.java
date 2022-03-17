package com.csulb.cookie;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.csulb.cookie.domain.Frosting;
import com.csulb.cookie.service.FrostingService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class CookieApplicationTests {

    @Autowired
    FrostingService service;

    @Test
    void testFrostingService() {

        QueryWrapper<Frosting> wrapper = new QueryWrapper<>();
        wrapper.eq("m_id", 1);

        List<Frosting> list = service.list(wrapper);
        System.out.println(list);

    }
}
