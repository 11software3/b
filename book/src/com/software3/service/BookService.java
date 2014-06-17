package com.software3.service;

import java.util.List;

import com.software3.pojo.Book;
import com.software3.pojo.BookComment;
import com.software3.pojo.Borrow;

public interface BookService 
{
	public boolean saveBook(Book book,String studentid);
	public List<Book> getBookByProvider(String name);
	public boolean deleteBook(int bookid,String studentid);
	public List<Book> searchBook(String bookname);
	public String getAboutBook(String bookid);
	public boolean BorrowBook(String studentid,String bookid,String remark);
	public List<Borrow> getBorrowRecord(String borrowstudentid);
	public boolean recommendBook(String bookid);
	public boolean rebackBook(int bookid,String studentid);
	public boolean addBookComment(BookComment bc);
}
