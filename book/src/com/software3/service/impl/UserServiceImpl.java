package com.software3.service.impl;

import java.sql.ResultSet;
import java.util.Random;

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
	public User getUserContact(String name){
		sql = "select * from user where name=?";
		try
		{
			user = new User();
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, name);
			ResultSet rs = userDao.query();
			if(rs.next()){
				user.setPhone(rs.getString("phone"));
				user.setWechat(rs.getString("wechat"));
				user.setWeibo(rs.getString("weibo"));
			}
			return user;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return user;
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
				user.setLevel(rs.getInt("level"));
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
	
	@Override
	public boolean checkStudentid(String studentid){
		sql = "select * from user where studentid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, studentid);
			if(userDao.query().next()){
				return true; //数据库中已存在学号
			}
			return false;//数据库中不存在学号
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean addUser(User user,String password,int type){
		String sql2 = "insert into login values(?,?,?)";
		sql ="insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, user.getStudentid());
			userDao.getPstmt().setString(2, user.getName());
			userDao.getPstmt().setString(3, user.getSex());
			userDao.getPstmt().setString(4, user.getClassandgrade());
			userDao.getPstmt().setString(5, user.getCollege());
			userDao.getPstmt().setString(6, user.getPhone());
			userDao.getPstmt().setString(7, user.getWechat());
			userDao.getPstmt().setString(8, user.getWeibo());
			userDao.getPstmt().setInt(9, user.getLevel());
			userDao.getPstmt().setInt(10, user.getCredits());
			userDao.getPstmt().setString(11, user.getPersonerinfo());
			boolean result1 =  userDao.commit();
			userDao.getCon(sql2);
			userDao.getPstmt().setString(1, user.getStudentid());
			userDao.getPstmt().setString(2, password);
			userDao.getPstmt().setInt(3, type);
			boolean result2 = userDao.commit();
			return result1 && result2;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean updateUser(User user){
		String sql = "update user set name=?,sex=?,classandgrade=?,college=?," +
				"phone=?,wechat=?,weibo=?,level=?,credits=?,personerinfo=? where studentid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, user.getName());
			userDao.getPstmt().setString(2, user.getSex());
			userDao.getPstmt().setString(3, user.getClassandgrade());
			userDao.getPstmt().setString(4, user.getCollege());
			userDao.getPstmt().setString(5, user.getPhone());
			userDao.getPstmt().setString(6, user.getWechat());
			userDao.getPstmt().setString(7, user.getWeibo());
			userDao.getPstmt().setInt(8, user.getLevel());
			userDao.getPstmt().setInt(9, user.getCredits());
			userDao.getPstmt().setString(10, user.getPersonerinfo());
			userDao.getPstmt().setString(11, user.getStudentid());
			return userDao.commit();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	@Override
	public boolean findPass(String studentid ,String phone){
		
		sql = "select name from user where studentid=? and phone=?";
		String sql2 = "update login set password=? where studentid=?";
		boolean result1 = false,result2 = false;
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, studentid);
			userDao.getPstmt().setString(2, phone);
		
			result1 = userDao.query().next();//先看是否存在此学号和手机号
			if(result1){
				userDao.getCon(sql2); 
				String newpass = UserServiceImpl.getRandomString(10);
				userDao.getPstmt().setString(1, newpass);
				userDao.getPstmt().setString(2, studentid);//重新设置密码
				result2 = userDao.commit();
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return result1 && result2;
		
	}
	
	/**
	 * 修改密码
	 */
	@Override
	public boolean updatePass(String studentid,String pass1){
		String sql = "update login set password=? where studentid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, pass1);
			userDao.getPstmt().setString(2, studentid);
			return userDao.commit();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 检查旧密码是否正确
	 */
	@Override 
	public boolean oldPassisRight(String studentid,String pass0){
		String sql = "select studentid from login where studentid=? and password=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, studentid);
			userDao.getPstmt().setString(2, pass0);
			return userDao.query().next();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	@Override
	public boolean checkCredits(String studentid){
		sql = "select credits from user where studentid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, studentid);
			ResultSet rs = userDao.query();
			if(rs.next()){
				if(rs.getInt("credits") >= 100){
					return true;
				}
			}else{
				return false;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public static String getRandomString(int length) { //length表示生成字符串的长度  
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 }     

	
}
