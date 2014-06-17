package com.software3.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.BookComment;
import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/commentbook")
public class CommentBookServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		BookComment bc = new BookComment();
		bc.setBookid(Integer.parseInt(request.getSession(true).getAttribute("bcbookid").toString()));
		bc.setComment(request.getParameter("comment"));
		bc.setCommentauthor(request.getSession(true).getAttribute("name").toString());
		bc.setCommentdate(new Date());
		if(bs.addBookComment(bc)){
			response.getWriter().write("success");
		}else{
			response.getWriter().write("fail");
		}
	}
}
