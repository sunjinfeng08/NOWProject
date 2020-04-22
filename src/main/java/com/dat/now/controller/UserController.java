package com.dat.now.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dat.now.bean.AJAXResult;
import com.dat.now.bean.Page;
import com.dat.now.bean.User;
import com.dat.now.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	
	//批量删除表数据
	@ResponseBody
	@RequestMapping("/deletes")
	public Object deletes( Integer[] userid ) {
		AJAXResult result = new AJAXResult();		
		try {			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userids", userid);
			userService.deleteUsers(map);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	// 单个删除用户
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer id) {
		AJAXResult result = new AJAXResult();

		try {

			userService.deleteUserById(id);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	// 保存更新的数据
	@ResponseBody
	@RequestMapping("/update")
	public Object update(User user) {
		AJAXResult result = new AJAXResult();
		try {
			userService.updateUser(user);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@RequestMapping("/edit")
	public String edit(Integer id, Model model) {

		User user = userService.queryById(id);
		model.addAttribute("user", user);

		return "user/edit";
	}

	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(User user) {
		AJAXResult result = new AJAXResult();

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			user.setCreatetime(sdf.format(new Date()));
			user.setUserpw("123456");
			userService.insertUser(user);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@RequestMapping("/add")
	public String add() {
		return "user/add";
	}

	@ResponseBody
	@RequestMapping("/pageQuery")
	public Object pageQuery(String queryText, Integer pageno, Integer pagesize, String useridfilter, String usernamefilter, String useremailfilter) {

		AJAXResult result = new AJAXResult();

		try {

			// 分页查询
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pageno - 1) * pagesize);
			map.put("size", pagesize);
			map.put("queryText", queryText);
            map.put("useridfilter", useridfilter);
            map.put("usernamefilter", usernamefilter);
            map.put("useremailfilter", useremailfilter);
			List<User> users = userService.pageQueryData(map);
			// 当前页码
			// 总的数据条数
			int totalsize = userService.pageQueryCount(map);
			// 最大页码（总页码）
			int totalno = 0;
			if (totalsize % pagesize == 0) {
				totalno = totalsize / pagesize;
			} else {
				totalno = totalsize / pagesize + 1;
			}

			// 分页对象
			Page<User> userPage = new Page<User>();
			userPage.setDatas(users);
			userPage.setTotalno(totalno);
			userPage.setTotalsize(totalsize);
			userPage.setPageno(pageno);

			result.setData(userPage);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;

	}

	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}

	@RequestMapping("/index1")
	public String index1(
			@RequestParam(required = false, defaultValue = "1") Integer pageno,
			@RequestParam(required = false, defaultValue = "10") Integer pagesize,
			Model model) {
		// 分页查询
		// limit start, size
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pageno - 1) * pagesize);
		map.put("size", pagesize);
		List<User> users = userService.pageQueryData(map);
		model.addAttribute("users", users);
		// 当前页码
		model.addAttribute("pageno", pageno);
		// 总的数据条数
		int totalsize = userService.pageQueryCount(map);
		// 最大页码（总页码）
		int totalno = 0;
		if (totalsize % pagesize == 0) {
			totalno = totalsize / pagesize;
		} else {
			totalno = totalsize / pagesize + 1;
		}
		model.addAttribute("totalno", totalno);
		return "user/index";
	}
	//excel导入操作
	@RequestMapping("/importexcel")
	public String importexcel() {
		return "user/importexcel";
	} 
}
