<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		p{
			width:100%;
			height:40px;
			font-size: white 1.1em;
			font-family: "微软雅黑";
			color:white;
		}
		label{
			width:90px;
			height:30px;
			padding-top:3px;
			margin-left: 20px;
			float: left;
			text-align:center;
		}
		input{
			padding-left:5px;
			float:left;
			width:160px;
			height:30px;
			border:1px solid;
			/* border-radius:10px; */
			font-size: 1.1em;
			font-family: "微软雅黑";
		}
		input:focus{
			background-color: #1abc9c;
			color:white;
		}
		select{
			width:50px;
			height:30px;
			float:left;
			margin-right: 110px;
			border:1px solid;
			/* border-radius:10px; */
			font-size: 1.1em;
			font-family: "微软雅黑";
		}
		textarea {
			width:450px;
			border:1px solid;
			/* border-radius:10px; */
			font-size: 1.1em;
			font-family: "微软雅黑";
		}
		.personerinfo{
			margin-top: 20px;
		}
	
		.xubox_title{
			height: 20px;
			line-height: 20px;
			width: 60%;
			top: 7px;
			left: 130px;
			font-style: normal;
			text-align:center;
			font-weight:bold;
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}
		.noborder{
			border: 0px;
			background-color: #34495e;
			color:white;
		}
		body{
			background-color: #34495e;
		}
		button{
			width:120px;
			height:40px;
			font-size:25px;
			background-color: rgb(61, 139, 211);
			border:1px solid  rgb(61, 139, 211);
			color:white;
			cursor:pointer;
			margin-top: 50px;
			margin-left: 150px;
		}
		button:hover{
			background-color: #1abc9c;
			border-color:1px solid  1abc9c;
		}
		button[class="no"]{
			width:120px;
			height:40px;
			font-size:25px;
			background-color:rgb(173, 171, 171);
			border:1px solid  rgb(173, 171, 171);
			color:white;
			cursor:pointer;
			margin-left:20px;
		}
		button[class='no']:hover{
			background-color: rgb(92, 90, 90);
			border-color:1px solid  rgb(92, 90, 90);
		}
	</style>
  </head>
  
  <body>
  	<form action="updateuser" method="post">
  		<div>
  			<p>
  				<label>学号:</label>
  				<input type="text" name="studentid" value="${user.studentid }" required/>
  				<label>姓名:</label>
  				<input type="text" name="name" value="${user.name }" required/>
  			</p>
  			
  			<p>
  				<label>性别:</label>
  				<select name="sex" required>
  					<option value="${user.sex }" seleted>${user.sex }</option>
  					<c:if test="${user.sex eq '男'}">
  						<option value="女">女</option>
  					</c:if>
  					<c:if test="${user.sex eq '女'}">
  						<option value="男">男</option>
  					</c:if>
  				</select>
  				<label>学院:</label>
  				<input type="text" name="college" value="${user.college }" required/>
  			</p>
  			
  			<p>
  				<label>班级:</label>
  				<input type="text" name="classandgrade" value="${user.classandgrade }" required/>
  				<label>手机号:</label>
  				<input type="text" name="phone" value="${user.phone }" required/>
  			</p>
  			
  			<p>
  				<label>等级:</label>
  				<input type="text" name="level" value="${user.level }" readOnly="readonly" required class="noborder"/>
  				<label>积分:</label>
  				<input type="text" name="credits" value="${user.credits }" readOnly="readonly" required class="noborder"/>
  			</p>
  			<p>
  				<label>微信:</label>
  				<input type="text" name="wechat" value="${user.wechat }" required/>
  				<label>微博:</label>
  				<input type="text" name="weibo" value="${user.weibo }" required/>
  			</p>
  			<p>
  				<label class="personerinfo">个人说明:</label>
  				<textarea rows="3" cols="20" required name="personerinfo"> ${user.personerinfo }</textarea>
  			</p>
  			<p>
  				<button id="updateuserinfo" onclick="return false;">提交</button>
  				<button class="no">关闭</button>
  			</p>
  		</div>
  	</form>
  	<script src="resources/js/jquery-1.11.1.js"></script>
    <script src="resources/layer/layer.min.js"></script>
  	<script type="text/javascript">
  		$("#updateuserinfo").on("click",function(){
  			$.ajax({
  				type:"POST",
  				url:"updateuser",
  				data:$("form").serialize()
  			})
  			.done(function(statu){
  				if(statu == "success"){
  					alert("修改成功");
  					var index = parent.layer.getFrameIndex(window.name);
  	            	parent.layer.close(index);
  				}else{
  					alert("修改失败");
  					
  				}
  			})
  			.error(function(data){
  				alert("数据库内部错误");
  				
  			});
  			
  		});
  		$(".no").on("click",function(){
				var index = parent.layer.getFrameIndex(window.name);
    		parent.layer.close(index);
		});
  	</script>
   
  </body>
</html>
