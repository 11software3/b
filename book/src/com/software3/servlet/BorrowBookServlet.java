package com.software3.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.service.BookService;
import com.software3.service.UserService;
import com.software3.service.impl.BookServiceImpl;
import com.software3.service.impl.UserServiceImpl;

@WebServlet("/borrowbook")
public class BorrowBookServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	UserService us = new UserServiceImpl();
	protected void doGet(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		//检查积分
		if(!us.checkCredits(request.getSession(true).getAttribute("studentid").toString())){
			try
			{
				response.getWriter().write("积分不够，请先分享图书");
			} catch (IOException e)
			{
				e.printStackTrace();
			}
			return ;
		}
		String studentid =  request.getSession(true).getAttribute("studentid").toString();
		String bookid = request.getParameter("bookid");
		String remark = "双方已同意";
		try
		{
		if(bs.BorrowBook(studentid, bookid, remark)){
			response.getWriter().write("操作成功");
		}else{
			response.getWriter().write("操作失败");
		}
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		
	}
}
