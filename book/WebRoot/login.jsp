<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="resources/image/book.ico" rel="shortcut icon"/><!-- 标签栏的图标 -->
		<title>校园图书互助平台V2.0</title>		
		<link href="resources/css/login.css" type="text/css" media="screen" rel="stylesheet">
		<style type="text/css">
			img, div { behavior: url(iepngfix.htc) }
		</style>
		<script src="resources/js/jquery-1.11.1.js"></script>
		<script type="text/javascript">
			function login(){
				var un = $("#user_name").val();
				var up = $("#user_password").val();
				un = un.trim();//去掉多余的空格
				if(un == ""){
					alert("用户名不能为空");
					return false;
				}else if(up == ""){
					alert("密码不能为空");
					return false;
				}
				//console.log(un);
				$.ajax({
					  type: "POST",
					  url: "login",
					  data: {
					  	user_name : un,
					  	user_password:up
					  },
					})//执行成功之后判断返回的状态
					.done(function(data){
						//登录成功
						if(data == "success"){
							window.location="index.jsp"
						}else{
							//登录失败
							alert("用户名或密码错误");
							$("#user_name").focus();
						}
					})//执行失败后
					.fail(function(){
						alert("数据库内部错误");
					});
			}
			
		</script>
		
</head>
<body id="login" youdao="bind" ryt13299="1">
<c:if test="${not empty studentid}">
	<script>
		window.location="index.jsp";
	</script>
</c:if>
		<div id="wrappertop"></div>
			<div id="wrapper">
					<div id="content">
						<div id="header">
							<h1>校园图书互助平台V2.0</h1>
						</div>
						<div id="darkbanner" class="banner320">
							<h2>登录</h2>
						</div>
						<div id="darkbannerwrap">
						</div>
						<form name="form1" method="post" action="">
						<fieldset class="form">
                        	 <p>
								<label for="user_name">学号:</label>
								<input name="user_name" id="user_name" placeholder="请输入学号" type="text" value="">
							</p>
							<p>
								<label for="user_password">密码:</label>
								<input name="user_password" placeholder="密码" id="user_password" type="password">
							</p>
							<button class="positive" name="" onclick="login();return false;">
								<img src="resources/image/key.png" alt="Announcement">登录
							</button>
							<a href="#" id="forgetpsw">忘记密码？</a>
							</fieldset>
						</form>
					</div>
				</div>  
			<div id="wrapperbottom_branding">
				<div id="wrapperbottom_branding_text">
					<a href="https://www.teambition.com/project/53992d4daa67781f4615cdd1/home" title="访问我们的项目主页" target="_blank">11级软件3班蔡斌组</a>
				</div>
			</div>
			<script type="text/javascript">
				var forget = document.getElementById("forgetpsw");
				forget.onclick=function(){
					alert("忘记密码");
				}
			</script>
</body>
</html>