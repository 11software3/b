package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/findpass")
public class FindPassServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService us = new UserServiceImpl();
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		boolean isExist = us.findPass(request.getParameter("studentid"),request.getParameter("phone"));
		if(isExist==true){
			response.getWriter().write("yes");
		}else{
			response.getWriter().write("no");
		}
	}

}
