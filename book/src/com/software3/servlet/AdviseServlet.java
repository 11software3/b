package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/advise")
public class AdviseServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getParameter("advice"));
		try
		{
			response.getWriter().write("success");
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

}
