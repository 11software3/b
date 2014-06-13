package com.software3.service.impl;

import java.sql.ResultSet;

import com.software3.dao.DBDao;
import com.software3.pojo.User;
import com.software3.service.UserService;

public class UserServiceImpl implements UserService
{
	
	DBDao userDao = new DBDao();
	User user = null;
	String sql = ""; 
	@Override
	public boolean userLogin(String username,String password,int type)
	{
		if(username.contains("select") || username.contains("from") || username.contains("user")){
			return false;
		}
		sql = "select studentid from login where studentid=? and password=? and type=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, username);
			userDao.getPstmt().setString(2, password);
			userDao.getPstmt().setInt(3, type);
			return userDao.query().next();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public User getUser(String studentid){
		sql = "select * from user where studentid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, studentid);
			ResultSet rs = userDao.query();
			if(rs.next()){
				user = new User();
				user.setStudentid(studentid);
				System.out.println(rs.getString("name"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setClassandgrade(rs.getString("classandgrade"));
				user.setCollege(rs.getString("college"));
				user.setCredits(rs.getInt("credits"));
				user.setLevel(rs.getInt("credits"));
				user.setPersonerinfo(rs.getString("personerinfo"));
				user.setPhone(rs.getString("phone"));
				user.setWechat(rs.getString("wechat"));
				user.setWeibo(rs.getString("weibo"));
				return user;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

}
