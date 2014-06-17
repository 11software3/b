package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.User;
import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/provider")
public class ProviderServlet extends HttpServlet
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService us = new UserServiceImpl();
	protected void doGet(HttpServletRequest request,HttpServletResponse response){
		User user = new User();
		String name = request.getParameter("provider");
		user = us.getUserContact(name);
		response.setCharacterEncoding("utf-8");
		try
		{
			response.getWriter().write("姓名："+name+"<br>"+"电话："+user.getPhone()+"<br>微信："+user.getWechat()+"<br>微博："+user.getWeibo());
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}
