package com.dat.now.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.dat.now.bean.User;


public interface UserDao {
	@Select("select * from user")
	List<User> queryAll();
	
	@Select("select * from user where id = #{id} and userpw = #{userpw}")
	User queryUser(User user);
	
	List<User> pageQueryData(Map<String, Object> map);

	int pageQueryCount(Map<String, Object> map);

	void insertUser(User user);

	@Select("select * from user where id1 = #{id}")
	User queryById(Integer id);

	void updateUser(User user);

	void deleteUserById(Integer id);

	void deleteUsers(Map<String, Object> map);	
	

}
