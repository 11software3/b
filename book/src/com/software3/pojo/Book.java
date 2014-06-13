package com.software3.pojo;

public class Book
{
	int bookid;
	String bookname;
	String type;//分类
	String aboutbook;
	int currentstate;//当前状�?
	String author;
	String provider;//提供�?
	int borrowtimes;//借阅次数
	int recommend;//推荐次数
	
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
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getAboutbook()
	{
		return aboutbook;
	}
	public void setAboutbook(String aboutbook)
	{
		this.aboutbook = aboutbook;
	}
	public int getCurrentstate()
	{
		return currentstate;
	}
	public void setCurrentstate(int currentstate)
	{
		this.currentstate = currentstate;
	}
	public String getAuthor()
	{
		return author;
	}
	public void setAuthor(String author)
	{
		this.author = author;
	}
	public String getProvider()
	{
		return provider;
	}
	public void setProvider(String provider)
	{
		this.provider = provider;
	}
	public int getBorrowtimes()
	{
		return borrowtimes;
	}
	public void setBorrowtimes(int borrowtimes)
	{
		this.borrowtimes = borrowtimes;
	}
	public int getRecommend()
	{
		return recommend;
	}
	public void setRecommend(int recommend)
	{
		this.recommend = recommend;
	}

}
