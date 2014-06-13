<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body#login input{
			width:200px;
		}
		body#login label{
			width:70px;
			margin-left: 20px;
			float: left;
		}
		body#login input{
			float:left;
		}
		body#login span{
			width:200px;
			height:30px;
			float:left;
		}
		body#login select{
			width:50px;
			height:30px;
			float:left;
			margin-right: 160px;
		}
		body#login button{
			float:left;
			margin-left: 80px;
			margin-top: 10px;
			width:50px;
			height:25px;
			font-size:16px;
			cursor: pointer;
		}
		body#login span {
			width: 30px;
			height: 30px;
			float: left;
		}
		.xubox_title em {
			height: 20px;
			line-height: 20px;
			width: 60%;
			top: 7px;
			left: 130px;
			font-style: normal;
			font-weight:bold;
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}
	</style>
  </head>
  
  <body>
  	<br>
  	<form>
    <div>
    	<p>
    		<label>学号：</label>
    		<input type="text" name="studentid" placeholder="学号" required/>
    		<label>密码：</label>
    		<input type="password" name="pass1" placeholder="密码" required/>
    		<label>确认密码：</label>
    		<input type="password" name="pass2" placeholder="再次输入密码" required/>
    	</p>
    	<p>
    		<label>姓名：</label>
    		<input type="text" name="name" placeholder="姓名" required/>
    		<label>性别：</label>
    		<select name="sex" required>
    			<option></option>
    			<option value="男">男</option>
    			<option value="女">女</option>
    		</select>
    	</p>
    	<p>
    		<label>学院：</label>
    		<input type="text" name="college" placeholder="学院" required/>
    		<label>班级：</label>
    		<input type="text" name="classandgrade" placeholder="班级" required/>
    	</p>
    	
    	<p>
    		<label>微信：</label>
    		<input type="text" name="wechat" placeholder="微信" title="如果你没有微信，此项可不填"/>
    		<label>微博：</label>
    		<input type="text" name="weibo" placeholder="微博" title="如果你没有微博，此项可不填"/>
    	</p>
    	<p>
    		<label>手机：</label>
    		<input type="text" name="phone" placeholder="手机" required/>
    		
    	</p>
    </div>
    <div>
    	<p>
    		<button id="sign_send">确认</button>
    	</p>
    </div>
    </form>
    <script type="text/javascript">
    	$("#sign_send").on("click",function(){
    		$.ajax({
    			type:"POST",
    			url: "signin",
				data: $("form").serialize(),//序列化表单数据
    		})
    		.done(function(data){
    			if(data=="success"){
    				window.location="signin_success.html";
    			}else{
    				alert(data);
    			}
    		})
    		.fail(function(){
    			alert("数据库内部错误")
    		});
    		return false;
    	});
    </script>
  </body>
</html>
