package com.csulb.cookie.mapper;

import com.csulb.cookie.bean.Review;
import com.csulb.cookie.domain.Customer;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerMapper extends BaseMapper<Customer> {

    List<Review> getUnreviewedOrders(Integer id);
    List<Review> getReviewedOrders(Integer id);

}




