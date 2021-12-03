package com.demo.controller;

import com.demo.entity.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class HelloController {

    // 请求路径："/" --> /WEB-INF/templates/index.html
    @RequestMapping("/")
    public String index() {
        // 返回视图名称
        return "index";
    }

    @RequestMapping("/hello")
    public String hello() {
        return "hello";
    }


    @RequestMapping("/user")
    @ResponseBody
    public User user() {
        ApplicationContext app = new ClassPathXmlApplicationContext("ApplicationContextConfig.xml");
        JdbcTemplate jdbcTemplate = app.getBean("jdbcTemplate", JdbcTemplate.class);
        String sql = "select * from t_user where id = 2";

        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class));
    }

    @RequestMapping("/users")
    @ResponseBody
    public List<User> users() {
        ApplicationContext app = new ClassPathXmlApplicationContext("ApplicationContextConfig.xml");
        JdbcTemplate jdbcTemplate = app.getBean("jdbcTemplate", JdbcTemplate.class);
        String sql = "select * from t_user";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
    }





}
