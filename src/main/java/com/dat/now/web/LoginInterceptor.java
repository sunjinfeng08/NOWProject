package com.dat.now.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dat.now.bean.User;
import com.dat.now.controller.DispatcherController;

/**
 * 登陆拦截器
 * 
 * @author 18801
 * 
 */
public class LoginInterceptor implements HandlerInterceptor {

	Logger log = LoggerFactory.getLogger(LoginInterceptor.class);

	/**
	 * 在控制器执行之前完成业务逻辑操作 方法的返回值决定逻辑是否继续执行， true，表示继续执行， false, 表示不再继续执行。
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		// 判断当前用户是否已经登陆
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginName");

		if (loginUser == null) {
			String path = session.getServletContext().getContextPath();
			response.sendRedirect(path + "/login");
			log.info("请先登录系统");
			return false;
		} else {
			log.info("系统登录成功");
			return true;
		}
	}

	/**
	 * 在控制器执行完毕之后执行的逻辑操作
	 */
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

	/**
	 * 在完成视图渲染之后，执行此方法。
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}