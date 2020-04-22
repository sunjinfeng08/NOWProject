package com.dat.now.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dat.now.bean.User;
import com.dat.now.dao.UserDao;
import com.dat.now.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	public List<User> queryAll() {
		return userDao.queryAll();
	}
	public User queryUser(User user) {
		return userDao.queryUser(user);
	}
	public List<User> pageQueryData(Map<String, Object> map) {
		return userDao.pageQueryData(map);
	}
	public int pageQueryCount(Map<String, Object> map) {
		return userDao.pageQueryCount(map);
	}
	public void insertUser(User user) {
		userDao.insertUser(user);
	}
	public User queryById(Integer id) {
		return userDao.queryById(id);
	}
	public void updateUser(User user) {
		userDao.updateUser(user);		
	}
	//单个删除操作
	public void deleteUserById(Integer id) {
		userDao.deleteUserById(id);		
	}
	//批量删除操作
	public void deleteUsers(Map<String, Object> map) {
		userDao.deleteUsers(map);		
	}
	
	

}
