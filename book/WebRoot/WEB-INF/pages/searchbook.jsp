<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" href="/book/resources/css/font-awesome.min.css"/>
	<style type="text/css">
		body{
			background-color: #34495e;
			color:white;
			font-family:"΢���ź�";
		}
		label{
			font-size:1.5em;
		}
		input[name="searchtext"]{
			width:500px;
			height:30px;
			font-size:1.5em;
			border-radius:10px;
			background-color:rgba(52, 73, 94, 0.74);
			padding-left:5px;
			color:white;
		}
		input[name="searchtext"]:focus{
			background-color:#fff;
			color:#000;
		}
		a{
			margin-left:10px;
			height:100px;
			width:100px;
			color:white;
		}
		.fa-search:before {
			margin-top:5px;
			font-size: 30px;
		}
	</style>
	
  </head>
  
  <body>
   		<div>
   			<p class="searchbar">
   				<label>������������������</label>
   				<input type="text" id="searchtext" name="searchtext" placeholder="��������� �����">
   				<span><a href="#" id="searchbutton"><i class="fa fa-search"></i></a></span>
   			</p>
   		</div>
   		<script src="/book/resources/js/jquery-1.11.1.js"></script>
   		<script type="text/javascript">
   			$("#searchbutton").on("click",function(){
   				var searchvalue = $("#searchtext").val();
   				alert("�������ˡ���"+searchvalue)
   			});
   		</script>
  </body>
</html>
