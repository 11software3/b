package com.software3.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.User;
import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/getuserinfo")
public class GetUserInfoServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response){
		UserService us = new UserServiceImpl();
		User user = new User();
		String studentid = (String)request.getSession(true).getAttribute("studentid");
		user = us.getUser(studentid);
		request.setAttribute("user",user);
		try
		{
			request.getRequestDispatcher("/WEB-INF/pages/userinfo.jsp").forward(request,response);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
