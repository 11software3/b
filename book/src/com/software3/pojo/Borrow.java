package com.software3.pojo;

import java.util.Date;

public class Borrow
{
	int borrowid;
	String borrowstudentid;
	String provider;
	String bookname;
	int bookid;
	Date starttime;
	Date endtime;
	String remark;//备注 
	
	public int getBorrowid()
	{
		return borrowid;
	}
	public void setBorrowid(int borrowid)
	{
		this.borrowid = borrowid;
	}
	public String getBorrowstudentid()
	{
		return borrowstudentid;
	}
	public void setBorrowstudentid(String borrowstudentid)
	{
		this.borrowstudentid = borrowstudentid;
	}
	public String getProvider()
	{
		return provider;
	}
	public void setProvider(String provider)
	{
		this.provider = provider;
	}
	public String getBookname()
	{
		return bookname;
	}
	public void setBookname(String bookname)
	{
		this.bookname = bookname;
	}
	public int getBookid()
	{
		return bookid;
	}
	public void setBookid(int bookid)
	{
		this.bookid = bookid;
	}
	public Date getStarttime()
	{
		return starttime;
	}
	public void setStarttime(Date starttime)
	{
		this.starttime = starttime;
	}
	public Date getEndtime()
	{
		return endtime;
	}
	public void setEndtime(Date endtime)
	{
		this.endtime = endtime;
	}
	public String getRemark()
	{
		return remark;
	}
	public void setRemark(String remark)
	{
		this.remark = remark;
	}

}
