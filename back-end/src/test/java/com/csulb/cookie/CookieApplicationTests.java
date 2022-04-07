package com.csulb.cookie;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.csulb.cookie.bean.Review;
import com.csulb.cookie.domain.Frosting;
import com.csulb.cookie.mapper.CustomerMapper;
import com.csulb.cookie.service.FrostingService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class CookieApplicationTests {

    @Autowired
    FrostingService service;
    @Autowired
    CustomerMapper mapper;

    @Test
    void testFrostingService() {

        QueryWrapper<Frosting> wrapper = new QueryWrapper<>();
        wrapper.eq("m_id", 1);

        List<Frosting> list = service.list(wrapper);
        System.out.println(list);

    }

    @Test
    void testSelectUnreviewedOrder() {
        List<Review> unreviewedOrders = mapper.getUnreviewedOrders(24);
        System.out.println(unreviewedOrders);
    }

    @Test
    void testSelectReviewedOrder() {
        List<Review> unreviewedOrders = mapper.getReviewedOrders(24);
        System.out.println(unreviewedOrders);
    }

}
