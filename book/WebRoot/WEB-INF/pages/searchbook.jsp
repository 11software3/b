<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" href="/book/resources/css/font-awesome.min.css"/>
    <meta charset="utf-8">
	<style type="text/css">
		body{
			background-color: white;
			color:#000;
			font-family:"微软雅黑";
			width:1012px;
			padding: 0;
		}
		label{
			font-size:1.5em;
			margin-left: 200px;
		}
		input[name="searchtext"]{
			width:500px;
			height:30px;
			font-size:1.5em;
			/* border-radius:10px; */
			margin-bottom:8px;
			padding-left:5px;
			color:#000;
		}
		input[name="searchtext"]:focus{
			background-color:#fff;
			color:#000;
		}
		a{
			margin-left:10px;
			height:100px;
			width:100px;
			color:#1abc9c;
		}
		.fa-search:before {
			margin-top:5px;
			zoom:150%;
		}
		p{
			border-bottom: 1px dotted rgb(79, 174, 228);
		}
		table{
			border-collapse: collapse;
		}
		th,td{
			width:98px;
			height:25px;
			text-align: center;
			font-weight:normal;
			border: 1px dotted rgb(79, 174, 228);
		}
		td > a{
			text-decoration: none;
		}
		th{
			color:white;
			background-color: rgb(79, 174, 228);
			font-size: 1em;
		}
		tr{
			border-bottom: 1px dotted rgb(79, 174, 228);
			font-size:1em;
		}
		tr:hover{
			cursor: pointer;
		}
	</style>
	
  </head>
  
  <body>
  		<form action="searchbook" method="post">
   		<div>
   			<p class="searchbar">
   				<label></label>
   				<input type="text" id="searchtext" name="searchtext" placeholder="例如：黑客与画家">
   				<span><a href="#" id="searchbutton" onclick="return false;"><i class="fa fa-search"></i></a></span>
   			</p>
   		</div>
   		<div id="booklist" class="content">
   			暂时没有数据...
   		</div>
   		</form>
   		<script src="/book/resources/js/jquery-1.11.1.js"></script>
   		<script src="resources/layer/layer.min.js"></script>
    	<script src="resources/js/jquery.popmenu.js"></script>
   		<script type="text/javascript">
   			function searchbook(){
   				$.ajax({
   					type:"POST",
   					url:"searchbook",
   					data:$("form").serialize()
   				})
   				.done(function(data){
   					$("#booklist").html(data);
   					return false;
   				})
   				.error(function(){
   					alert("数据库内部错误");
   					var index = parent.layer.getFrameIndex(window.name);
   	        		parent.layer.close(index);
   	        		return false;
   				});
   				return false;
   			}
   			
   			$("#searchbutton").on("click",searchbook);
   			$(document).keydown(function(event) { 
   				if(event.keyCode == 13){
   					searchbook();
   	   				return false;
   				}
   			});
   			
   			function aboutbook(bookid){
   				$.ajax({
   					type:"GET",
   					url:"aboutbook?bookid="+bookid
   				})
   				.done(function(data){
   					var ab = function(){
   						var index = $.layer({
   					    type: 1,
   					    title: false,
   					    area: ['420px', '260px'],
   					    shade: [0],
   					    border:[0],
   					    page: {
   					        html: data
   					    }, success: function(){
   					        layer.shift('left'); //左边动画弹出
   					    }
   					});
   					};
   					ab(data);
   					return false;
   				})
   				.error(function(){
   					alert("数据库内部错误");
   					var index = parent.layer.getFrameIndex(window.name);
   	        		parent.layer.close(index);
   	        		return false;
   				});
   				return false;
   			}
   			
   			//获取提供者联系方式
   			function getprovider(provider){
   				
   				$.ajax({
   					type:"GET",
   					url:"provider?provider="+provider
   				})
   				.done(function(data){
   					var ab = function(){
   						var index = $.layer({
   					    type: 1,
   					    title: false,
   					    area: ['420px', '260px'],
   					    shade: [0],
   					    border:[0],
   					    page: {
   					        html: data
   					    }, success: function(){
   					        layer.shift('left'); //左边动画弹出
   					    }
   					});
   					};
   					ab(data);
   					return false;
   				})
   				.error(function(){
   					alert("数据库内部错误");
   					var index = parent.layer.getFrameIndex(window.name);
   	        		parent.layer.close(index);
   	        		return false;
   				});
   				return false;
   			}
   			
   			function borrowbook(bookid){
				if(confirm("你确定要借吗？")){
					$.ajax({
	   					type:"GET",
	   					url:"borrowbook?bookid="+bookid
	   				})
	   				.done(function(data){
	   					alert(data);
	   				})
	   				.error(function(){
	   					alert("数据库内部错误");
	   				})
   				}
   			}
   		</script>
  </body>
</html>
