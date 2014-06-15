package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.User;
import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/updateuser")
public class UpdateUserServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService us = new UserServiceImpl();
	User user = null;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		user = new User();
		user.setStudentid(request.getParameter("studentid"));
		user.setName(request.getParameter("name"));
		user.setCollege(request.getParameter("college"));
		user.setClassandgrade(request.getParameter("classandgrade"));
		user.setSex(request.getParameter("sex"));
		user.setPhone(request.getParameter("phone"));
		user.setWechat(request.getParameter("wechat"));
		user.setWeibo(request.getParameter("weibo"));
		user.setPersonerinfo(request.getParameter("personerinfo"));
		user.setCredits(Integer.parseInt(request.getParameter("credits")));
		user.setLevel(Integer.parseInt(request.getParameter("level")));
		if(us.updateUser(user)){
			response.getWriter().write("success");
		}else{
			response.getWriter().write("fail");
		}
	}
}
