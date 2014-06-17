<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta charset="utf-8">
	
	
  </head>
  
  <body>
    <table>
  		<thead>
  			<tr>
  				<th>ID</th>
  				<th>书名</th>
  				<th>作者</th>
  				<th>分类</th>
  				<th>当前状态</th>
  				<th>提供者</th>
  				<th>借阅次数</th>
  				<th>推荐次数</th>
  				<th>发布日期</th>
  				<th></th>
  			</tr>
  		</thead>
    	<c:forEach var="b" items="${booklist}">
    		<tr>
    			<td><c:out value="${b.bookid}"></c:out></td>
    			<td><a href="#" onclick="aboutbook(${b.bookid});return false" title="点击查看简介">《<c:out value="${b.bookname}"></c:out>》</a></td>
    			<td><c:out value="${b.author}"></c:out></td>
    			<td><c:out value="${b.type}"></c:out></td>
    			<td>
    				<c:if test="${b.currentstate eq 0}">空闲</c:if>
    				<c:if test="${b.currentstate eq 1 }">已借出</c:if>
    			</td>
    			<td><a href="#" onclick="getprovider('${b.provider}');return false" title="点击查看提供者联系方式"><c:out value="${b.provider }"></c:out></a></td>
    			<td><c:out value="${b.borrowtimes }"></c:out></td>
    			<td><c:out value="${b.recommend }"></c:out></td>
    			<td><c:out value="${b.sharetime }"></c:out></td>
    			<td class="delete">
    				<c:if test="${b.currentstate eq 1 }">暂时不能借</c:if>
    				<c:if test="${b.currentstate eq 0 }"><a href="#" onclick="borrowbook(${b.bookid});return false;">我要借</a></c:if></td>
    		</tr>
    	</c:forEach>
    </table>
  </body>
</html>
