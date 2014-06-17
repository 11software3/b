<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{
			 background-color:white;
		}
		*{
			margin:0;
			padding:0;
			list-style:none;
			font-size:14px
		}
		.nTab{
			width:1012px;
		}
		.none {display:none;}
		
		.nTab .TabTitle li{
			float:left;
			cursor:pointer;
			height:40px;
			line-height:40px;
			font-size:1.5em;
			font-family:"΢���ź�";
			text-align:center;
			width:50%;
		}
		.nTab .TabTitle li a{
			text-decoration:none;
		}
		.nTab .TabTitle .active{
			background:#1abc9c;
			color:white;
		}
		.nTab .TabTitle .normal{
			background:grey;
			color:white;
		}
		.nTab .TabContent{
			margin-top:10px;
			height:560px;
			color:#000;
		}
		#myTab1_Content0,#myTab1_Content1{
			font-family:"΢���ź�";
			font-size:25px;
		}
		table{
			border-collapse: collapse;
		}
		th,td{
			width:110px;
			height:25px;
			
			text-align: center;
			font-weight:normal;
			border: 1px dotted rgb(79, 174, 228);
		}
		th{
			color:white;
			background-color: rgb(79, 174, 228);
			font-size: 1.3em;
		}
		tr{
			border-bottom: 1px dotted rgb(79, 174, 228);
			font-size:1.2em;
		}
		tr:hover{
			cursor: pointer;
		}
		
		.delete{
			width:30px;
			padding-left: 10px;
			background-color:white;
			display: table-cell;
			border-left: 1px solid rgb(79, 174, 228);
		}
		
		.bottom{
			margin-top: 390px;
			text-align:center;
			width:1015px;
			height:50px;
			position:absolute;
			bottom:0;
			right:5px
		}
		
		handle{
			float:left;
			display:inline-block;
		}
		button{
			margin-top:10px;
			width:100px;
			height:35px;
			margin-right: 20px;
			cursor: pointer;
		}
		a[class="page"]{
			text-decoration: none;
			height:35px;
			margin-right: 20px;
			font-size: 1.3em;
		}
		
		td[class="reback"]{
			width:50px;
		
			background-color:white;
			display: table-cell;
			border-left: 1px solid rgb(79, 174, 228);
		}
		th[class="reback"]{
			width:70px;
			display: table-cell;
			border-left: 1px solid rgb(79, 174, 228);
		}
		td[class="time2"],th[class="time2"]{
			width:185px;
		}
		a{
			text-decoration: none;
		}
		a:VISITED{
			color: grey;
		}
		a:HOVER{
			color:#1abc9c;
		}
		
	</style>
</head>
<body>

<div class="nTab">
		<div class="TabTitle">
		<ul id="myTab1">
			<li class="active" id="sharebook" onclick="chosetab(this,0); gsb();">�ҷ�����ͼ��</li>
			<li class="normal" id="borrowbook" onclick="chosetab(this,1); gbb();">�ҽ��ͼ��</li> 			      
		</ul>
		</div>
	    <div class="TabContent">
			<div id="myTab1_Content0">
			
			</div>
			<div id="myTab1_Content1" class="none"></div>		
	    </div>	
</div>


    
    <script src="resources/js/jquery-1.11.1.js"></script>
    <script src="resources/layer/layer.min.js"></script>
    
    <script src="resources/js/jquery.popmenu.js"></script>
    <script type="text/javascript">
    	function chosetab(thisObj,num){
    		if(thisObj.className == "active"){
    			return ;
    		}
    		var tabObj = thisObj.parentNode.id;
    		var tabList = document.getElementById(tabObj).getElementsByTagName("li");
    		for(var i = 0;i < tabList.length; i++){
    			var newid = tabObj+"_Content"+i;
    			if(i == num){
    				thisObj.className = "active";
    				document.getElementById(tabObj+"_Content"+i).style.display = "block";
    			}else{
    				tabList[i].className = "normal";
    				document.getElementById(tabObj+"_Content"+i).style.display = "none";
    			}
    		}
    	}
    	
    	//�����ͼ��
    	function gsb(){
    		$.ajax({
    			type:"GET",
    			url:"getsharebook"
    		})
    		.done(function(data){
    			$("#myTab1_Content0").html(data);
    		})
    		.error(function(){
    			alert("���ݿ��ڲ�����");
    			var index = parent.layer.getFrameIndex(window.name);
        		parent.layer.close(index);
    		});
    	}
    	
    	//�ҽ��ͼ��
    	function gbb(){
    		$.ajax({
    			type:"GET",
    			url:"getborrowbook"
    		})
    		.done(function(data){
    			$("#myTab1_Content1").html(data);
    		})
    		.error(function(){
    			alert("���ݿ��ڲ�����");
    			var index = parent.layer.getFrameIndex(window.name);
        		parent.layer.close(index);
    		});
    	}
    	
    	$(document).ready(function(){
    		$.ajax({
    			type:"GET",
    			url:"getsharebook"
    		})
    		.done(function(data){
    			$("#myTab1_Content0").html(data);
    		})
    		.error(function(){
    			alert("���ݿ��ڲ�����");
    			var index = parent.layer.getFrameIndex(window.name);
        		parent.layer.close(index);
    		});
    	});

    	function deletebook(bookid){
    		if(confirm("ȷ��Ҫɾ����¼:"+bookid+"?")){
    			$.ajax({
        			type:"GET",
        			url:"deletebook?bookid="+bookid
        		})
        		.done(function(data){
        			alert(data);
        		})
        		.error(function(){
        			alert("���ݿ��ڲ�����");
        			var index = parent.layer.getFrameIndex(window.name);
            		parent.layer.close(index);
        		});
    			gsb();//���¼�������
    		}
    	}
    	
    	function recommendbook(bookid){
    		$.ajax({
    			type:"GET",
    			url:"recommendbook?bookid="+bookid
    		})
    		.done(function(data){
    			layer.msg('�Ƽ��ɹ�',2,{
						type:10,
						rate:500
				});
    		})
    		.error(function(){
    			alert("���ݿ��ڲ�����");
    			var index = parent.layer.getFrameIndex(window.name);
        		parent.layer.close(index);
    		});
    	}
    	
    	function rebackbook(bookid,bookname){
    		if(confirm("ȷ���黹ͼ�顶"+bookname+"����")){
    			$.ajax({
        			type:"GET",
        			url:"rebackbook?bookid="+bookid
        		})
        		.done(function(data){
        			layer.msg('�ѳɹ��黹,��������50,�ȼ�����1��',2,{
						type:10,
						rate:500
					});
        		})
        		.error(function(){
        			alert("���ݿ��ڲ�����");
        			var index = parent.layer.getFrameIndex(window.name);
            		parent.layer.close(index);
        		});
    			gbb();
    		}
    	}
    	function commentbook(bookid,bookname){
    		var advise = function(){
            	var index = $.layer({
            		type: 2,
            	    maxmin: true,
            	    shadeClose: true,
            	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">��������</div>',
            	    border: [0],
            	    shade: [0.1,'#fff'],
            	    offset: ['105px','350px'],
            	    area: ['400px','300px'],
            	    iframe: {src: "common?r=bookcomment&&bookid="+bookid}
            	});
            }
    		advise();
    		return false;
    	}
    </script>
  </body>
</html>
