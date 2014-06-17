package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/recommendbook")
public class RecommendBookServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(bs.recommendBook(request.getParameter("bookid"))){
			response.getWriter().write("推荐成功");
		}
		else{
			response.getWriter().write("操作失败了");
		}
	}
}
