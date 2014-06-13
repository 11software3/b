package com.software3.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String username = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		if(username.equals("3111006164") && password.equals("888888")){
			response.getWriter().write("success");
		}else{
			response.getWriter().write("failure");
		}
	}
	
}
