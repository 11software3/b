package com.software3.service;

import com.software3.pojo.User;

public interface UserService
{
	public boolean userLogin(String username,String password,int type);
	public User getUser(String username);
}
