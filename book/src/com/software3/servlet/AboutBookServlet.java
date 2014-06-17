package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/aboutbook")
public class AboutBookServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		try
		{
			response.getWriter().write(bs.getAboutBook(request.getParameter("bookid")));
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

}
