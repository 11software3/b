<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="utf-8">
    <base href="<%=basePath%>">
  </head>
  
  <body>
  	<table>
  		<thead>
  			<tr>
  				<th></th>
  				<th>ID</th>
  				<th>书名</th>
  				<th>作者</th>
  				<th>分类</th>
  				<th>当前状态</th>
  				<th>提供者</th>
  				<th>借阅次数</th>
  				<th>推荐次数</th>
  				<th>发布日期</th>
  			</tr>
  		</thead>
    	<c:forEach var="b" items="${booklist}">
    		<tr>
    			<td class="delete">
    				<c:if test="${b.currentstate eq 0}">
    					<a href="#" title="一旦删除就不可恢复喽"onclick="deletebook(${b.bookid});return false;">删除</a>
    				</c:if>
    				<c:if test="${b.currentstate eq 1}">不能删除</c:if>
    				</td>
    			<td><c:out value="${b.bookid}"></c:out></td>
    			<td>《<c:out value="${b.bookname}"></c:out>》</td>
    			<td><c:out value="${b.author}"></c:out></td>
    			<td><c:out value="${b.type}"></c:out></td>
    			<td>
    				<c:if test="${b.currentstate eq 0}">空闲</c:if>
    				<c:if test="${b.currentstate eq 1}">已借出</c:if>	
    			</td>
    			<td><c:out value="${b.provider }"></c:out></td>
    			<td><c:out value="${b.borrowtimes }"></c:out></td>
    			<td><c:out value="${b.recommend }"></c:out></td>
    			<td><c:out value="${b.sharetime }"></c:out></td>
    		</tr>
    	</c:forEach>
    </table>
    <div class="bottom">
    	<div class="handle">
    		<a href="#" class="page" onclick="alert('已经是第一页了');return false;">上一页</a>
    		<a href="#" class="page" onclick="alert('没有下一页了');return false;">下一页</a>
    		
    		<button id="close">关闭当前页面</button>
    	</div>
    </div>
     <script src="resources/js/jquery-1.11.1.js"></script>
    <script src="resources/layer/layer.min.js"></script>
    
    <script src="resources/js/jquery.popmenu.js"></script>
    <script type="text/javascript">
    	$("#close").on("click",function(){
    		var index = parent.layer.getFrameIndex(window.name);
    		parent.layer.close(index);
    	});
    </script>
  </body>
</html>
