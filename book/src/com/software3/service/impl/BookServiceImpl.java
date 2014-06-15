package com.software3.service.impl;

import com.software3.dao.DBDao;
import com.software3.pojo.Book;
import com.software3.pojo.User;
import com.software3.service.BookService;

public class BookServiceImpl implements BookService
{
	DBDao userDao = new DBDao();
	User user = null;
	String sql = ""; 
	
	@Override
	public boolean saveBook(Book book)
	{
		sql = "insert into book values(?,?,?,?,?,?,?,?,?,?)";
		
		try
		{	
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, null);
			userDao.getPstmt().setString(2, book.getBookname());
			userDao.getPstmt().setString(3, book.getType());
			userDao.getPstmt().setString(4, book.getAboutbook());
			userDao.getPstmt().setInt(5, book.getCurrentstate());
			userDao.getPstmt().setString(6, book.getAuthor());
			userDao.getPstmt().setString(7, book.getProvider());
			userDao.getPstmt().setInt(8, book.getBorrowtimes());
			userDao.getPstmt().setInt(9, book.getRecommend());
			userDao.getPstmt().setDate(10,book.getSharetime());
			return userDao.commit();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

}
