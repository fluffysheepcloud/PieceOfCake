package com.csulb.cookie;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.csulb.cookie.bean.PrebuildCakeBean;
import com.csulb.cookie.bean.Review;
import com.csulb.cookie.domain.Frosting;
import com.csulb.cookie.domain.PrebuildCake;
import com.csulb.cookie.mapper.CustomerMapper;
import com.csulb.cookie.mapper.PrebuildCakeMapper;
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
    CustomerMapper cMapper;

    @Autowired
    PrebuildCakeMapper pcMapper;

    @Test
    void testFrostingService() {

        QueryWrapper<Frosting> wrapper = new QueryWrapper<>();
        wrapper.eq("m_id", 1);

        List<Frosting> list = service.list(wrapper);
        System.out.println(list);

    }

    @Test
    void testSelectUnreviewedOrder() {
        List<Review> unreviewedOrders = cMapper.getUnreviewedOrders(24);
        System.out.println(unreviewedOrders);
    }

    @Test
    void testSelectReviewedOrder() {
        List<Review> unreviewedOrders = cMapper.getReviewedOrders(24);
        System.out.println(unreviewedOrders);
    }

    @Test
    void testSelectPrebuildCakes() {
        List<PrebuildCakeBean> cakes = pcMapper.getPrebuildCakesById(1);
        cakes.forEach(System.out::println);
    }

    @Test
    void testSelectOnePrebuildCake() {
        PrebuildCakeBean oneCakeById = pcMapper.getOneCakeById(1);
        System.out.println(oneCakeById);
    }
}
