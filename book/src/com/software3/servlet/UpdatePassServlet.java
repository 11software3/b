package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.UserService;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/updatepass")
public class UpdatePassServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost (HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserService us = new UserServiceImpl();
		String pass0 = request.getParameter("pass0");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		if(pass1.equals(pass2) == false){
			response.getWriter().write("pass1neqpass2");
		}
		else if(false == us.oldPassisRight(request.getSession(true).getAttribute("studentid").toString(), pass0)){
			response.getWriter().write("pass0error");
		}else if(us.updatePass(request.getSession(true).getAttribute("studentid").toString(), pass1)){
			response.getWriter().write("success");
		}
	}
	
}
