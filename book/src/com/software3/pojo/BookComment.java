package com.software3.pojo;

import java.util.Date;

public class BookComment
{
	int commentid;//评论ID
	int bookid;//图书ID
	String bookname;//书名
	String comment;//评论
	String commentauthor;//评论者
	Date commentdate;
	public int getCommentid()
	{
		return commentid;
	}
	public void setCommentid(int commentid)
	{
		this.commentid = commentid;
	}
	public int getBookid()
	{
		return bookid;
	}
	public void setBookid(int bookid)
	{
		this.bookid = bookid;
	}
	public String getBookname()
	{
		return bookname;
	}
	public void setBookname(String bookname)
	{
		this.bookname = bookname;
	}
	public String getComment()
	{
		return comment;
	}
	public void setComment(String comment)
	{
		this.comment = comment;
	}
	public String getCommentauthor()
	{
		return commentauthor;
	}
	public void setCommentauthor(String commentauthor)
	{
		this.commentauthor = commentauthor;
	}
	public Date getCommentdate()
	{
		return commentdate;
	}
	public void setCommentdate(Date commentdate)
	{
		this.commentdate = commentdate;
	}
	
}
