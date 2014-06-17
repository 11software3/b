package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/deletebook")
public class DeleteBookServlet extends HttpServlet
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
			if(bs.deleteBook(Integer.parseInt(request.getParameter("bookid")),
							request.getSession(true).getAttribute("studentid").toString())){
				response.getWriter().write("操作成功");
			}
			else{
				response.getWriter().write("操作失败");
			}
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}
