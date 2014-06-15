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
		<link href="resources/image/tushu.ico" rel="shortcut icon"/><!-- 标签栏的图标 -->
		<title>校园图书互助平台V2.0</title>		
		<link href="resources/css/login.css" type="text/css" media="screen" rel="stylesheet">
		<script src="resources/js/jquery-1.11.1.js"></script>
		<script src="resources/layer/layer.min.js"></script>
		<style type="text/css">
			img, div { behavior: url(iepngfix.htc) }
		</style>
		
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
					  data: $("form").serialize(),//序列化表单数据
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
<body id="login">
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
								<input name="user_name" id="user_name" placeholder="请输入学号" required type="text" value="">
							</p>
							<p>
								<label for="user_password">密码:</label>
								<input name="user_password" placeholder="密码" id="user_password" required type="password">
							</p>
							<button class="positive" name="" onclick="login();return false;">
								<img src="resources/image/key.png" alt="Announcement">登录
							</button>
							<a href="#" id="forgetpsw" title="点此找回密码">忘记密码？</a>
							<a href="javascript:;" id="signin" title="注册成为新用户">注册</a>
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
				
				
				var page = {};
				//方法固定要写成这样
				layer.login = function(options){
					options = options || {};
				    $.layer({
				        type: 1,
				        title: '用户注册',
				        offset: [($(window).height() - 450)/2+'px', ''],
				        border : [5, 0.5, '#666'],
				        area: ['650px','350px'],
				        shadeClose: true,
				        page: page
				    });
				};
				
				$("#signin").on("click",function(){

				    page.url = 'signin.jsp'
				     
					layer.login();
				}); 
				
	
				var page2={};
				page2.url = 'forgetpass.html';
				var layerLoop = function(){
				    var index = $.layer({
				        type:1,
				        fix: false,
				        area: ['350px','200px'],
				        moveOut: true,
				        zIndex: layer.zIndex,
				        shade: [0],
				        title: '忘记密码',
				        offset: [($(window).height() - 450)/2+'px', ''],
				        //以下对html做转义是为了防止被代码演示解析，实际应用时无需转义
				        page: page2, 
				        
				    });
				};
				$('#forgetpsw').on('click', layerLoop);
				
				
			</script>
</body>
</html>