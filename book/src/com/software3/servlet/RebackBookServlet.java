package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/rebackbook")
public class RebackBookServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(bs.rebackBook(Integer.parseInt(request.getParameter("bookid")),
						request.getSession(true).getAttribute("studentid").toString())){
			response.getWriter().write("yes");
		}else{
			response.getWriter().write("no");
		}
	}
}
