<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>图书互助平台V2.0</title>		
		<link href="resources/css/login.css" type="text/css" media="screen" rel="stylesheet">
		<style type="text/css">
			img, div { behavior: url(iepngfix.htc) }
		</style>
		<script type="text/javascript">
			function login(){
				alert("hehe");
				return false;
			}
		</script>#c5e6ea
		
</head>
<body id="login" youdao="bind" ryt13299="1">
		<div id="wrappertop"></div>
			<div id="wrapper">
					<div id="content">
						<div id="header">
							<h1>图书互助平台V2.0</h1>
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
								<input name="user_name" id="user_name" type="text" value="">
							</p>
							<p>
								<label for="user_password">密码:</label>
								<input name="user_password" id="user_password" type="password">
							</p>
							<button class="positive" name="Submit" onclick="login();return false;">
								<img src="resources/image/key.png" alt="Announcement">登录
							</button>
							</fieldset>
						</form>
					</div>
				</div>  
			<div id="wrapperbottom_branding"><div id="wrapperbottom_branding_text">11级软件3班蔡斌组</div></div>
</body>
</html>