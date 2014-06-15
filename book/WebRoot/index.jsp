<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

  	<meta charset="UTF-8">
  	<link href="resources/image/tushu.ico" rel="shortcut icon"/><!-- 标签栏的图标 -->
	<title>校园图书互助平台2.0</title>
	<link rel="stylesheet" href="resources/css/font-awesome.min.css"/>
    <style>
    	
        #container{
            max-width: 480px;
            width: 100%;
            /* margin: 0 auto; */
            margin-left: 20px;
        }
        #demo_box{
            width: 480px;
        }
        .fa{
            font-size: 40px;
            line-height: 70px;
        }
        .fa-bars{
            color: #3498db;
        }
        pre{
            font-family: Consolas,Liberation Mono,Courier,monospace;
            font-size: 13px;
        }
        @media screen and (orientation: portrait){
            pre{
                overflow-x: scroll;
            }
        }
        h1{
        	color:white;
        	font-family:'微软雅黑';
        }	
        a{
        	text-decoration: none;
        }
        .layer_notice{
        	display:none;
        	color:#34495e;
        	padding-left:5px;
        	font-family: '微软雅黑';
        	background-color:white;
        }
    </style>
</head>

<body style="background-color: rgb(79, 174, 228);">
   <c:if test="${empty studentid}">
	<script>
		window.location="login.jsp";
	</script>
  </c:if>
  	<div class="layer_notice" >
  		<h3>组长：蔡斌</h3>
  		<h3>组员：曾伟昌、陈俊成、黄柏林、张广通、吴淑娴</h3>
  	</div>
	<div id="container">
        <a href="https://www.teambition.com/project/53992d4daa67781f4615cdd1/home" target="_blank" title="点击访问小组主页"><h1>校园图书互助平台2.0</h1></a>
        <div id="demo_box">
            <div class="pop_ctrl"><i class="fa fa-bars"></i></div>
            <ul id="demo_ul">
                <li class="demo_li"><a href="#" id="user" title="点击这个你就可以看到你自身狂拽霸酷叼的个人信息了"><div><i class="fa fa-user"></i></div><div>个人信息</div></a></li>
                <li class="demo_li"><a href="#" id="updatepass" title="经常修改密码是个好事儿，安全！一般人我不告诉他"><div><i class="fa fa-key"></i></div><div>修改密码</div></a></li>
                <li class="demo_li"><a href="#" id="logout" title="退出应用"><div><i class="fa fa-sign-out"></i></div><div>注销</div></a></li>
                <li class="demo_li"><a href="#" id="sharebook" title="发布你的图书"><div><i class="fa fa-book"></i></div><div>我要分享</div></a></li>
                <li class="demo_li"><a href="#" id="searchbook" title="想借书吗？那就搜一些吧"><div><i class="fa fa-search"></i></div><div>搜一下！</div></a></li>
                <li class="demo_li"><a href="#" id="givebackbook" title="送君千里终有一别，别废话了，快把书还了"><div><i class="fa fa-mail-forward"></i></div><div>要归还了</div></a></li>
                <li class="demo_li"><a href="#" id="mybook" title="这里有你的图书哟"><div><i class="fa fa-bookmark"></i></div><div>我的图书</div></a></li>
                <li class="demo_li"><a href="#" id="advise" title="你有什么好的建(fu)议(li)吗？"><div><i class="fa fa-comment"></i></div><div>我有话说</div></a></li>
                <li class="demo_li"><a href="#" id="group" title="向我们辛苦的作者致敬！"><div><i class="fa fa-group"></i></div>传说中的成员<div></div></a></li>
            </ul>
        </div>
    </div>
    <script src="resources/js/jquery-1.11.1.js"></script>
    <script src="resources/layer/layer.min.js"></script>
    <script src="resources/js/jquery.popmenu.js"></script>
    <script>
    	
        $(function(){
            var func = $('#demo_box').popmenu({
            	'controller': false,       // use control button or not
                'width': '300px',         // width of menu
                'background': '#34495e',  // background color of menu
                'focusColor': '#1abc9c',  // hover color of menu's buttons
                'borderRadius': '0px',   // radian of angles, '0' for right angle
                'top': '50',              // pixels that move up
                'left': '2',              // pixels that move left
                'iconSize': '100px'       // size of menu's buttons
            });
            
            $(".fa fa-bars").mouseover(func);
        });
        
        var logout = function(){
        	var index = $.layer({
        	    shade: [0],
        	    border:[0],
        	    area: ['200px','auto'],
        	    title:'<style>.tt{font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">信息</div>',
        	    dialog: {
        	        msg: '<style>.m{padding-left:5px;text-align:center;font-family:"微软雅黑";font-size:1.3em;}</style><div class="m">退出应用?</div>',
        	        btns: 2,                    
        	        type: -1,
        	        btn: ['是的','否'],
        	        yes: function(){
        	        	window.location = "logout"
        	        }
        	    }
        	});
        };
     	$("#logout").on("click",logout);
        
        var team = function(){
        	var index = $.layer({
        	    type : 1,
        	    shade : [0],
        	    area : ['500px', '100px'],
        	    title : false,
        	    border : [0],
        	    page : {dom : '.layer_notice'}
        	});

        	 
        };
        $("#group").on("click",team);
     
        var userinfo = function(){
        	var index = $.layer({
        	    type: 2,
        	    maxmin: true,
        	    shadeClose: true,
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">个人信息</div>',
        	    border: [0],
        	    shade: [0.1,'#fff'],
        	    offset: ['20px','330px'],
        	    area: ['600px','500px'],
        	    iframe: {src: 'getuserinfo'}
        	}); 
        };
        $("#user").on("click",userinfo);
        
        /*修改密码*/
        var pass = function(){
        	var index = $.layer({
        		type: 2,
        	    maxmin: true,
        	    shadeClose: true,
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">修改密码</div>',
        	    border: [0],
        	    shade: [0.1,'#fff'],
        	    offset: ['105px','330px'],
        	    area: ['400px','290px'],
        	    iframe: {src: 'updatepass.jsp'}
        	});
        };
        $("#updatepass").on("click",pass);
       
        /*反馈建议*/
        var advise = function(){
        	var index = $.layer({
        		type: 2,
        	    maxmin: true,
        	    shadeClose: true,
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">反馈建议</div>',
        	    border: [0],
        	    shade: [0.1,'#fff'],
        	    offset: ['105px','330px'],
        	    area: ['400px','400px'],
        	    iframe: {src: 'advise.jsp'}
        	});
        }
        $("#advise").on("click",advise);
        
        var sharebook = function(){
        	var index = $.layer({
        		type: 2,
        	    maxmin: true,
        	    shadeClose: true,
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">发布图书</div>',
        	    border: [0],
        	    shade: [0.1,'#34495e'],
        	    offset: ['0px','350px'],
        	    area: ['1005px','630px'],
        	    iframe: {src: 'common?r=sharebook'}
        	});
        };
        $("#sharebook").on("click",sharebook);
        
        var searchbook = function(){
        	var index = $.layer({
        		type:2,
        		maxmin:true,
        		shadeClose:true,
        		title:'<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">搜索图书</div>',
        		border: [0],
        		shade:[0.1,'#34495e'],
        		offset:['0px','350px'],
        		area:['1005px','630px'],
        		iframe:{src:'common?r=searchbook'}
        	});
        }
        $("#searchbook").on("click",searchbook);
        
        var givebackbook = function(){
        	var index = $.layer({
        		type:2,
        		maxmin:true,
        		shadeClose:true,
        		title:'<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"微软雅黑";font-size:1.3em}</style><div class="tt">归还图书</div>',
        		border: [0],
        		shade:[0.1,'#34495e'],
        		offset:['0px','350px'],
        		area:['1005px','630px'],
        		iframe:{src:'common?r=givebackbook'}
        	});
        }
        $("#givebackbook").on("click",givebackbook);
        
       
    </script>
	
</body>

</html>
