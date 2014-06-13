package com.software3.service.impl;

import com.software3.dao.DBDao;
import com.software3.service.UserService;

public class UserServiceImpl implements UserService
{
	
	DBDao userDao = new DBDao();
	String sql = ""; 
	@Override
	public boolean login(String username,String password) throws Exception
	{
		if(username.contains("select") || username.contains("from") || username.contains("user")){
			return false;
		}
		sql = "select studentid from user where studentid=? and password=?";
		userDao.getCon(sql);
		userDao.getPstmt().setString(1, username);
		userDao.getPstmt().setString(2, password);
		return userDao.commit();
	}

}
