package com.software3.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.Book;
import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/getsharebook")
public class GetShareBookServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	Book b = null;
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		String name = (String)request.getSession(true).getAttribute("name");
		List<Book> bl = new ArrayList<Book>();
		bl = bs.getBookByProvider(name);
		if(bl.isEmpty()){
			response.getWriter().write("暂时没有数据..");
		}else{
			request.setAttribute("booklist", bl);
			try
			{
				request.getRequestDispatcher("/WEB-INF/pages/sharebooklist.jsp").forward(request,response);
			} catch (ServletException e)
			{
				e.printStackTrace();
			}
		}
		
	}
	
}
