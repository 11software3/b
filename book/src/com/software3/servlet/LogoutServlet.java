package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
/**
 * 
 * @author CaiBin
 * 注销登录
 */
public class LogoutServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(true);
		session.removeAttribute("studentid");
		session.removeAttribute("name");
		try
		{
			response.sendRedirect("login.jsp");
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}
