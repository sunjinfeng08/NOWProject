package com.dat.now.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dat.now.bean.AJAXResult;
import com.dat.now.bean.User;
import com.dat.now.service.UserService;

@Controller
public class DispatcherController {
	@Autowired
	UserService userService;
	Logger log = LoggerFactory.getLogger(DispatcherController.class);

	/*
	 * 退出系统
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// session.removeAttribute("loginUser");
		session.invalidate();
		return "redirect:login";
	}
	@RequestMapping("user/logout")
	public String userlogout(HttpSession session) {
		// session.removeAttribute("loginUser");
		session.invalidate();
		return "redirect:login";
	}
	@RequestMapping("product/logout")
	public String product(HttpSession session) {
		// session.removeAttribute("loginUser");
		session.invalidate();
		return "redirect:login";
	}
	/*
	 * 登录页面头页眉跳转
	 */
	@RequestMapping("/header")
	public String header() {
		return "indexTest";
	}

	/*
	 * 登录页面
	 */
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/registe")
	public String registe(){
		return "user/add";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	/*
	 * 用AJAX 执行登录操作
	 */
	@ResponseBody
	@RequestMapping("/doAJAXLogin")
	public Object doAJAXLogin(User user, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		AJAXResult result = new AJAXResult();
		User dbUser = userService.queryUser(user);
		boolean rememberMe = user.isRememberMe();
		log.info("rememberMe--->" + rememberMe);
		if (dbUser != null) {
			String userName = dbUser.getName();
			log.info("AJAX用户名查询--->" + dbUser);
			session.setAttribute("loginName", dbUser);
			String userInfo = dbUser.getName() + "," + dbUser.getUserpw();
			if (rememberMe) {
				// 添加cookie到浏览器
				Cookie userCookie = new Cookie(userName, userInfo);
				userCookie.setMaxAge(1 * 24 * 60 * 60); // 存活期为一天 1*24*60*60
				userCookie.setPath("/");
				log.info("userCookie记录用户名密码--->" + userCookie.getValue());
				response.addCookie(userCookie);
			}else{
				Cookie newCookie = new Cookie(userName, null);
				newCookie.setMaxAge(2 * 24 * 60 * 60); // 存活期为一天 1*24*60*60
				newCookie.setPath("/");
				response.addCookie(newCookie);
			}
			
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	/*
	 * 执行登录操作
	 */
	@RequestMapping("/doLogin")
	public String doLogin(User user, Model model) {
		String loginUser = user.getId();
		User dbUser = userService.queryUser(user);
		log.info("用户名查询--->" + dbUser);
		// 3) 判断用户信息是否存在
		if (dbUser != null) {
			// 登陆成功，跳转到主页面
			log.info("用户登录准备-->" + dbUser.getId());
			return "main";
		} else {
			log.info("用户登录失败-->");
			// 登陆失败，跳转回到登陆页面，提示错误信息
			String errorMsg = "登陆账号或密码不正确，请重新输入";
			model.addAttribute("errorMsg", errorMsg);
			return "redirect:login";
		}
	}
	@RequestMapping("/resetpass")
	public String resetpass(){
		
		return "/common/resetpass";
	}
	

}
