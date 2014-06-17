package com.software3.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.software3.pojo.Borrow;
import com.software3.service.BookService;
import com.software3.service.impl.BookServiceImpl;

@WebServlet("/getborrowbook")
public class GetBorrowBookServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookService bs = new BookServiceImpl();
	protected void doGet(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		String studentid = (String)request.getSession(true).getAttribute("studentid");
		List<Borrow> brl = new ArrayList<Borrow>();
		brl = bs.getBorrowRecord(studentid);
		if(brl.isEmpty()){
			response.getWriter().write("暂时没有数据..");
		}
		else{
			request.setAttribute("borrowlist", brl);
			try
			{
				request.getRequestDispatcher("/WEB-INF/pages/borrowbooklist.jsp").forward(request,response);
			} catch (ServletException e)
			{
				e.printStackTrace();
			}
		}
	}
	
}
