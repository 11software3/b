package com.software3.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.Book;
import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/sharebook")
public class ShareBookServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	Book b = null;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");/*专治各种乱码*/
		b = new Book();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
	    
		b.setAboutbook(request.getParameter("aboutbook"));
		b.setAuthor(request.getParameter("author"));
		b.setBookname(request.getParameter("bookname"));
		b.setBorrowtimes(Integer.parseInt(request.getParameter("borrowtimes")));
		b.setCurrentstate(Integer.parseInt(request.getParameter("currentstate")));
		b.setProvider(request.getParameter("provider"));
		b.setRecommend(Integer.parseInt(request.getParameter("recommend")));
		try
		{
			b.setSharetime(new Date(formatter.parse(request.getParameter("sharetime")).getTime()));
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		b.setType(request.getParameter("type"));
		if(bs.saveBook(b,request.getSession().getAttribute("studentid").toString())){
			response.getWriter().write("success");
		}else{
			response.getWriter().write("fail");
		}
		
	}
}
