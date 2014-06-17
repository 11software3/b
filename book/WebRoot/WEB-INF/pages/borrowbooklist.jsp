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
  			<tr class="borrow">
  				<th class="reback"></th>
  				<th>ID</th>
  				<th>书名</th>
  				<th>图书ID</th>
  				<th>提供者</th>
  				<th>开始时间</th>
  				<th class="time2">预期结束时间</th>
  				<th>推荐</th>
  				<th>写书评</th>
  			</tr>
  		</thead>
    	<c:forEach var="br" items="${borrowlist}">
    		<tr>
    			<td class="reback"><a href="#" title="归还图书" onclick="rebackbook('${br.bookid}','${br.bookname}');return false;">归还</a></td>
    			<td><c:out value="${br.borrowid}"></c:out></td>
    			<td>《<c:out value="${br.bookname}"></c:out>》</td>
    			<td><c:out value="${br.bookid}"></c:out></td>
    			<td><c:out value="${br.provider}"></c:out></td>
    			<td><c:out value="${br.starttime }"></c:out></td>
    			<td class="time2"><c:out value="${br.endtime }"></c:out></td>
    			<td><a href="#" title="喜欢此书吗？推荐给其他人吧"onclick="recommendbook('${br.bookid}');return false;">推荐此书</a></td>
    			<td><a href="#" title="我有话要说" onclick="commentbook('${br.bookid}','${br.bookname }');return false;">我要评论</a></td>
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
