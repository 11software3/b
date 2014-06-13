package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.User;
import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/signin")
/**
 * 
 * @author CaiBin
 * 注册
 */
public class SigninServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService us = new UserServiceImpl();
	User user;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(us.checkStudentid(request.getParameter("studentid"))==true){
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("学号已被注册");
		}
		else{
			user = new User();
			user.setStudentid(request.getParameter("studentid"));
			user.setName(request.getParameter("name"));
			user.setCollege(request.getParameter("college"));
			user.setClassandgrade(request.getParameter("classandgrade"));
			user.setSex(request.getParameter("sex"));
			user.setPhone(request.getParameter("phone"));
			user.setWechat(request.getParameter("wechat"));
			user.setWeibo(request.getParameter("weibo"));
			user.setPersonerinfo("新注册用户");
			user.setCredits(10);
			user.setLevel(1);
			//type = 2 表示为一般用户
			us.addUser(user,request.getParameter("pass1"),2);
			response.getWriter().write("success");
		}
	}
}
