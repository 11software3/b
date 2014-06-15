<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<style type="text/css">
		body{
			background-color: #34495e;
		}
		div{
			font-family:"微软雅黑";
			font-size:1.3em;
		}
		p{
			color:white;
			height:50px;
		}
		label{
			width:150px;
			margin-left: 60px;
			text-align:right;
			float:left;
		}
		input{
			padding-left:5px;
			width:230px;
			height:25px;
			font-size:20px;
			float:left;
		}
		select[name="type"]{
			padding-left:5px;
			width:230px;
			height:28px;
			font-size:20px;
			float:left;
		}
		select[name="currentstate"]{
			width:80px;
			height:28px;
			font-size:20px;
			float:left;
			margin-right: 159px;
		}
		textarea {
			padding-left:5px;
			width:750px;
			height:100px;
			font-size:25px;
		}
		.readonly{
			margin-top: 100px;
			border: 0px;
		}
		.readonly > input{
			border: 0px;
			background-color:#34495e;
			color:white;
		}
		.ab{
			margin-top: 35px;
			margin-left: 60px;
		}
		button[class="yes"]{
			width:120px;
			height:40px;
			font-size:25px;
			background-color: rgb(61, 139, 211);
			border:1px solid  rgb(61, 139, 211);
			color:white;
			cursor:pointer;
			margin-left:350px;
		}
		button[class='yes']:hover{
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
   		<form action="sharebook" method="post">
   			<div>
   				<p>
   					<label>书名：</label>
   					<input type="text" name="bookname" required>
   					<label>类型：</label>
   					<select name="type" required>
   						<option value="计算机类">计算机类</option>
   						<option value="人文类">人文类</option>
   						<option value="自然科学类">自然科学类</option>
   						<option value="小说杂文类">小说杂文类</option>
   						<option value="其他">其他</option>
   					</select>
   				</p>
   				<p>
   					<label>作者：</label>
   					<input type="text" name="author" required>
   					<label required>提供者：</label>
   					<input type="text" name="provider" required>
   					
   				</p>
   				<p>
   					<label>当前状态：</label>
   					<select name="currentstate">
   						<option value="0" selected>空闲</option>
   					</select>
   					<label>发布时间：</label>
   					<input type="date" id="sharetime" name="sharetime" required />
   				</p>
   				<p>
   					<label class="ab">简介：</label>
   					<textarea rows="2" cols="20" name="aboutbook" required></textarea>
   				</p>
   				<p class="readonly">
   					<label>被借次数：</label>
   					<input type="text" name="borrowtimes" value="0" />
   					<label>被推荐次数:</label>
   					<input type="text" name="recommend" value="0" readonly="true">
   				</p>
   				
   				<p>
   					<button class="yes" id="addbook" onclick="return false;">确定</button>
   					<button class="no">取消</button>
   				</p>
   			</div>
   		</form>
   		<script src="resources/js/jquery-1.11.1.js"></script>
    	<script src="resources/layer/layer.min.js"></script>
   		<script type="text/javascript">
   			$("#addbook").on("click",function(){
   				console.log($("form"));
   				$.ajax({
   					type:'POST',
   					url:'sharebook',
   					data:$("form").serialize()/*将表单序列化之后才能在后台接收*/
   				})
   				.done(function(statu){
   					if(statu == "success"){
   						layer.msg('发布成功',2,{
   							type:10,
   							rate:300
   						});
   						$("form")[0].reset();
   					}else{
   						layer.alert('发布失败', 8);
   					}
   				})
   				.error(function(){
   					layer.alert('数据库内部错误', 8);
   				})
   			});
   			$(".no").on("click",function(){
   				var index = parent.layer.getFrameIndex(window.name);
        		parent.layer.close(index);
   			});
   		</script>
  </body>
</html>
