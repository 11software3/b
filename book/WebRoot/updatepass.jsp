<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
  	
    <base href="<%=basePath%>">
	
	<style type="text/css">
		
		body{
			background-color: #34495e;
		}
		p{
			width:100%;
			height:40px;
			font-size: white 1.1em;
			font-family: "微软雅黑";
			color:white;
		}
		label{
			width:100px;
			height:30px;
			padding-top:3px;
			margin-left: 20px;
			float: left;
			text-align:center;
		}
		input{
			padding-left:5px;
			float:left;
			width:200px;
			height:30px;
			border:1px solid;
			/* border-radius:10px; */
			font-size: 1.1em;
			font-family: "微软雅黑";
		}
		button{
			margin-top: 10px;
			margin-left:100px;
			width:100px;
			height:40px;
			font-size:25px;
			background-color: rgb(61, 139, 211);
			border:1px solid  rgb(61, 139, 211);
			color:white;
			cursor:pointer;
		}
		button:hover{
			background-color: #1abc9c;
			border-color:1px solid  1abc9c;
		}
	</style>
  </head>
  
  <body>
  	
    <form action="updatapass" method="post">
    	<div>
    		<p>
    			<label>原来的密码：</label>
    			<input type="password" id="pass0" name="pass0" required>
    		</p>
    		<p>
    			<label>新的密码：</label>
    			<input type="password" id="pass1" name="pass1" required>
    		</p>
    		<p>
    			<label>再次输入：</label>
    			<input type="password" id="pass2" name="pass2" required>
    		</p>
    		<p>
    			<button id="updatepass" onclick="return false;">确认</button>
    		</p>
    	</div>
    </form>
    <script src="resources/js/jquery-1.11.1.js"></script>
    <script src="resources/layer/layer.min.js"></script>
    <script type="text/javascript">
    	$("#updatepass").on("click",function(){
    		var pass0 = $("pass0").val();
    		var pass1 = $("#pass1").val();
    		var pass2 = $("#pass2").val();
    		if(pass0 == "" ||pass1 == "" ||pass2 == "" ){
    			alert("密码不能为空");
    			$("#pass0").focus();
    			return false;
    		}
    		else if(pass1 != pass2){
        		alert("两次输入的新密码不一致");
        		$("#pass1").focus();
        		return false;
        	}
        	$.ajax({
        		 type: "POST",
    			 url: "updatepass",
    			 data: $("form").serialize()//序列化表单数据
        	})
        	.done(function(statu){
        		if (statu == "pass0error"){
        			alert("原来的密码错误，请再次输入");
        			$("#pass0").focus();
        			return false;
        		}else if(statu == "pass1neqpass2"){
        			alert("两次输入的新密码不一致");
        			return false;
        		}else if(statu == "success"){
        			alert("修改成功");
        			var index = parent.layer.getFrameIndex(window.name);
            		parent.layer.close(index);
        			return true;
        		}
        	})
        	.error(function(){
        		alert("数据库内部出错");
        		return false;
        	})
        	return false;
    	});
    </script>
  </body>
</html>
