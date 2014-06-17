<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta charset="utf-8">
	
	<style type="text/css">
		body{
			background-color: #34495e;
		}
		.user{
			width:380px;
			height:30px;
			padding-top:3px;
			float: left;
		}
		p{
			width:100%;
			height:40px;
			font-size: white 1.1em;
			font-family: "微软雅黑";
			color:white;
		}
		
		textarea {
			width:380px;
			border:1px solid;
			/* border-radius:10px; */
			font-size: 1.1em;
			font-family: "微软雅黑";
		}
		button{
			width:120px;
			height:40px;
			font-size:25px;
			background-color: rgb(61, 139, 211);
			border:1px solid  rgb(61, 139, 211);
			color:white;
			cursor:pointer;
			margin-top: 90px;
			margin-left: 0;
		}
		button:hover{
			background-color: #1abc9c;
			border-color:1px solid  1abc9c;
		}
	</style>
  </head>
  
  <body>
    <form action="commentbook" method="post">
    	<div>
    		<p>
    			<label>请将您的评论写在下方</label>
    		</p>
    		<p>
    			<textarea rows="5" cols="20" name="comment"></textarea>
    		</p>
    		<p>
    			<button id="commentbook" onclick="return false;">提交</button>
    		</p>
    	</div>
    	</form>
    <script src="resources/js/jquery-1.11.1.js"></script>
    	<script src="resources/layer/layer.min.js"></script>
    	<script src="resources/js/jquery.popmenu.js"></script>
    	<script type="text/javascript">
    		$("#commentbook").on("click",function(){
    			$.ajax({
    				type:"POST",
    				url:"commentbook",
    				data:$("form").serialize()
    			})
    			.done(function(statu){
    				if(statu == "success"){
    					alert("发表成功");
    				}else{
    					alert("操作失败");
    				}
    				var index = parent.layer.getFrameIndex(window.name);
            		parent.layer.close(index);
    			})
    			.error(function(){
    				layer.alert("数据库跪了。。ORZ");
    			})
    		});
    		
    	</script>
  </body>
</html>
