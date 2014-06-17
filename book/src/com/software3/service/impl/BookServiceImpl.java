package com.software3.service.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.software3.dao.DBDao;
import com.software3.pojo.Book;
import com.software3.pojo.BookComment;
import com.software3.pojo.Borrow;
import com.software3.pojo.User;
import com.software3.service.BookService;

public class BookServiceImpl implements BookService
{
	DBDao userDao = new DBDao();
	User user = null;
	String sql = ""; 
	
	/**
	 * 发布图书
	 */
	@Override
	public boolean saveBook(Book book,String studentid)
	{
		sql = "insert into book values(?,?,?,?,?,?,?,?,?,?)";
		boolean b1,b2;
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
			b1 = userDao.commit();
			String sql2 = "update user set credits=credits+45 where studentid=?";
			userDao.getCon(sql2);
			userDao.getPstmt().setString(1, studentid);
			b2 = userDao.commit();
			return b1 && b2;
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获得图书
	 */
	@Override
	public List<Book> getBookByProvider(String name){
		List<Book> bl = new ArrayList<Book>();
		sql = "select * from book where provider = ?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, name);
			ResultSet rs = userDao.query();
			while(rs.next()){
				Book b = new Book();
				b.setAboutbook(rs.getString("aboutbook"));
				b.setAuthor(rs.getString("author"));
				b.setBookid(rs.getInt("bookid"));
				b.setBookname(rs.getString("bookname"));
				b.setBorrowtimes(rs.getInt("borrowtimes"));
				b.setCurrentstate(rs.getInt("currentstate"));
				b.setProvider(rs.getString("provider"));
				b.setRecommend(rs.getInt("recommend"));
				b.setSharetime(rs.getDate("sharetime"));
				b.setType(rs.getString("type"));
				bl.add(b);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return bl;
	}
	
	/**
	 * 取消发布
	 */
	@Override
	public boolean deleteBook(int bookid,String studentid){
		sql = "delete from book where bookid=?";
		boolean b1,b2;
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setInt(1, bookid);
			
			b1 = userDao.commit();
			String sql2 = "update user set credits=credits-45 where studentid=?";
			userDao.getCon(sql2);
			userDao.getPstmt().setString(1, studentid);
			b2 = userDao.commit();
			return b1 && b2;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 搜索图书
	 */
	@Override
	public List<Book> searchBook(String bookname){
		List<Book> bl = new ArrayList<Book>();
		sql = "select * from book where bookname like '%"+bookname+"%'";
		try
		{
			userDao.getCon(sql);
			
			ResultSet rs = userDao.query();
			while(rs.next()){
				Book b = new Book();
				b.setAboutbook(rs.getString("aboutbook"));
				b.setAuthor(rs.getString("author"));
				b.setBookid(rs.getInt("bookid"));
				b.setBookname(rs.getString("bookname"));
				b.setBorrowtimes(rs.getInt("borrowtimes"));
				b.setCurrentstate(rs.getInt("currentstate"));
				b.setProvider(rs.getString("provider"));
				b.setRecommend(rs.getInt("recommend"));
				b.setSharetime(rs.getDate("sharetime"));
				b.setType(rs.getString("type"));
				bl.add(b);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return bl;
	}
	
	@Override
	public String getAboutBook(String bookid){
		sql = "select aboutbook from book where bookid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, bookid);
			ResultSet rs = userDao.query();
			if(rs.next()){
				return rs.getString("aboutbook");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "";
	}
	
	@Override
	public boolean BorrowBook(String studentid,String bookid,String remark){
		sql = "select * from book where bookid=?";
		String sql2 = "insert into borrow values(?,?,?,?,?,?,?,?)";
		try
		{
			String provider = "";
			String bookname = "";
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, bookid);
			ResultSet rs = userDao.query();
			if(rs.next()){
				provider = rs.getString("provider");
				bookname = rs.getString("bookname");
			}
			userDao.getCon(sql2);
			userDao.getPstmt().setString(1, null);
			userDao.getPstmt().setString(2,studentid);
			userDao.getPstmt().setString(3, provider);
			userDao.getPstmt().setString(4,bookname);
			userDao.getPstmt().setString(5,bookid);
			
			Calendar c=Calendar.getInstance();
			Date date=new Date();
			c.setTime(date);
			c.add(Calendar.MONTH,2); //将当前日期加2个月
			
			userDao.getPstmt().setDate(6, new java.sql.Date(date.getTime()));
			userDao.getPstmt().setDate(7 , new java.sql.Date(c.getTimeInMillis()));
			userDao.getPstmt().setString(8,remark);
			
			boolean b1 = userDao.commit();
			userDao.getCon("update book set currentstate = 1,borrowtimes = borrowtimes+1 where bookid=?");
			userDao.getPstmt().setString(1, bookid);
			return userDao.commit() && b1;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public List<Borrow> getBorrowRecord(String borrowstudentid){
		sql = "select * from borrow where borrowstudentid=?";
		List<Borrow> brl = new ArrayList<Borrow>();
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, borrowstudentid);
			ResultSet rs = userDao.query();
			while(rs.next()){
				Borrow br = new Borrow();
				br.setBookid(rs.getInt("bookid"));
				br.setBookname(rs.getString("bookname"));
				br.setBorrowid(rs.getInt("borrowid"));
				br.setBorrowstudentid(rs.getString("borrowstudentid"));
				br.setProvider(rs.getString("provider"));
				br.setStarttime(rs.getDate("starttime"));
				br.setEndtime(rs.getDate("endtime"));
				br.setRemark(rs.getString("remark"));
				brl.add(br);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return brl;
	}
	
	@Override
	public boolean recommendBook(String bookid){
		sql = "update book set recommend=recommend+1 where bookid=?";
		try
		{
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, bookid);
			return userDao.commit();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	/*归还图书*/
	@Override
	public boolean rebackBook(int bookid,String studentid){
		String sql2 = "";
		String sql3 = "";
		boolean b1,b2,b3;
		try
		{
			sql = "update book set currentstate = 0 where bookid=?";
			userDao.getCon(sql);
			userDao.getPstmt().setInt(1, bookid);
			b1 = userDao.commit();
			
			sql2 = "update user set level=level+1,credits=credits+50 where studentid=?";
			userDao.getCon(sql2);
			userDao.getPstmt().setString(1, studentid);
			b2 = userDao.commit();
			
			sql3 = "delete from borrow where bookid=?";
			userDao.getCon(sql3);
			userDao.getPstmt().setInt(1,bookid);
			b3 = userDao.commit();
			return b1 && b2 && b3;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean addBookComment(BookComment bc){
		sql = "insert into bookcomment values(?,?,?,?,?,?)";
		String bookname = "";
		try
		{
			String sql2 = "select bookname from book where bookid=?";
			userDao.getCon(sql2);
			userDao.getPstmt().setInt(1, bc.getBookid());
			ResultSet rs = userDao.query();
			if(rs.next()){
				bookname = rs.getString("bookname");
			}
			userDao.getCon(sql);
			userDao.getPstmt().setString(1, null);
			userDao.getPstmt().setInt(2, bc.getBookid());
			userDao.getPstmt().setString(3, bookname);
			userDao.getPstmt().setString(4, bc.getComment());
			userDao.getPstmt().setString(5, bc.getCommentauthor());
			userDao.getPstmt().setDate(6,new java.sql.Date(bc.getCommentdate().getTime()));
			return userDao.commit();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
