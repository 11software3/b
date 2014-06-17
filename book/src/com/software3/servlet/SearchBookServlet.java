package com.software3.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.Book;
import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/searchbook")
public class SearchBookServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		try
		{
			List<Book> bl = bs.searchBook(request.getParameter("searchtext"));
			if(bl.isEmpty()){
				response.getWriter().write("暂时没有数据哦，换个关键字试试吧");
			}
			else{
				request.setCharacterEncoding("utf-8");
				request.setAttribute("booklist", bl);
				try
				{
					request.getRequestDispatcher("/WEB-INF/pages/searchbooklist.jsp").forward(request,response);
				} catch (ServletException e)
				{
					e.printStackTrace();
				}
			}
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}
