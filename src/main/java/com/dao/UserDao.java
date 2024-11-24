package com.dao;

import com.entity.User;

public interface UserDao {

	public int userRegister(User user);
	public User verifyUserDetails(String email,String password);
	
	public boolean checkPassword(int id,String pwd);
	
	public int updateProfile(User user);
	
	public boolean checkUser(String em);
}
