package com.dat.now.service;

import java.util.List;
import java.util.Map;

import com.dat.now.bean.User;


public interface UserService {
	List<User> queryAll();
	User queryUser(User user);
	List<User> pageQueryData(Map<String, Object> map);
	int pageQueryCount(Map<String, Object> map);
	void insertUser(User user);
	User queryById(Integer id);
	void updateUser(User user);
	//单个删除操作
	void deleteUserById(Integer id);
	//批量删除操作
	void deleteUsers(Map<String, Object> map);
	

}
