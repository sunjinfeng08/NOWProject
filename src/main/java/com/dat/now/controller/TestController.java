package com.dat.now.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dat.now.bean.User;
import com.dat.now.service.UserService;


@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private UserService userService;
	
	/*
	 * 验证SpringMVC框架是否集成成功
	 */
	
    @RequestMapping("/index")
    public String index() {
        return "indexTest";
    }
    /*
     * 测试验证Spring框架 & Mybatis是否集成成功
     */
    @ResponseBody
	@RequestMapping("/queryAll")
	public Object queryAll() {
		List<User> users = userService.queryAll();
		return users;
	}
}
