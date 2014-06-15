package com.software3.service;

import com.software3.pojo.User;

public interface UserService
{
	public boolean userLogin(String username,String password,int type);
	public User getUser(String username);
	public boolean checkStudentid(String studentid);
	public boolean addUser(User user,String password,int type);
	public boolean findPass(String studentid, String phone);
	public boolean updatePass(String studentid,String pass1);
	public boolean oldPassisRight(String studentid,String pass0);
}
