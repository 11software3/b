package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.User;
import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/login")
/**
 * 
 * @author CaiBin
 * 登录
 */
public class LoginServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService us = new UserServiceImpl();
	User user = null;
	protected void doPost(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String username = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		int type = 2;
		if(us.userLogin(username, password, type)){
			response.getWriter().write("success");
			user = new User();
			user = us.getUser(username);
			request.getSession(true).setAttribute("studentid",user.getStudentid());
			request.getSession(true).setAttribute("name", user.getName());
		}else{
			response.getWriter().write("failure");
		}
	}
	
}
