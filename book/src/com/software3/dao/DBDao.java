package com.software3.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBDao {
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost/book?useUnicode=true&&characterEncoding=UTF-8";
	String user = "root";
	String password = "root";
	ResultSet rs;
	private Connection conn=null;
	private PreparedStatement pstmt = null;
	public void getCon(String sql) throws Exception{
			Class.forName(driver);
		
			conn = DriverManager.getConnection(url, user, password);
	
			pstmt = conn.prepareStatement(sql);
	
	}
	public boolean commit() throws SQLException{
			return getPstmt().executeUpdate()>0?true:false;
	}
	 public void CloseLink(){
	    	try{
	    		rs.close();
	    		pstmt.close();
	    		conn.close();
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
	    }
	
	public ResultSet query() throws SQLException {
		 	rs=null;
			rs = getPstmt().executeQuery();
			return rs;
	}
	public PreparedStatement getPstmt() {
		return pstmt;
	}
	public void setPstmt(PreparedStatement pstmt) {
		this.pstmt = pstmt;
	}
}
