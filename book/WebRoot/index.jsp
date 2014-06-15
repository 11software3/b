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
  	<link href="resources/image/tushu.ico" rel="shortcut icon"/><!-- ��ǩ����ͼ�� -->
	<title>У԰ͼ�黥��ƽ̨2.0</title>
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
        	font-family:'΢���ź�';
        }	
        a{
        	text-decoration: none;
        }
        .layer_notice{
        	display:none;
        	color:#34495e;
        	padding-left:5px;
        	font-family: '΢���ź�';
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
  		<h3>�鳤���̱�</h3>
  		<h3>��Ա����ΰ�����¿��ɡ��ư��֡��Ź�ͨ�������</h3>
  	</div>
	<div id="container">
        <a href="https://www.teambition.com/project/53992d4daa67781f4615cdd1/home" target="_blank" title="�������С����ҳ"><h1>У԰ͼ�黥��ƽ̨2.0</h1></a>
        <div id="demo_box">
            <div class="pop_ctrl"><i class="fa fa-bars"></i></div>
            <ul id="demo_ul">
                <li class="demo_li"><a href="#" id="user" title="��������Ϳ��Կ����������ק�Կ��ĸ�����Ϣ��"><div><i class="fa fa-user"></i></div><div>������Ϣ</div></a></li>
                <li class="demo_li"><a href="#" id="updatepass" title="�����޸������Ǹ����¶�����ȫ��һ�����Ҳ�������"><div><i class="fa fa-key"></i></div><div>�޸�����</div></a></li>
                <li class="demo_li"><a href="#" id="logout" title="�˳�Ӧ��"><div><i class="fa fa-sign-out"></i></div><div>ע��</div></a></li>
                <li class="demo_li"><a href="#" id="sharebook" title="�������ͼ��"><div><i class="fa fa-book"></i></div><div>��Ҫ����</div></a></li>
                <li class="demo_li"><a href="#" id="searchbook" title="��������Ǿ���һЩ��"><div><i class="fa fa-search"></i></div><div>��һ�£�</div></a></li>
                <li class="demo_li"><a href="#" id="givebackbook" title="�;�ǧ������һ�𣬱�ϻ��ˣ�����黹��"><div><i class="fa fa-mail-forward"></i></div><div>Ҫ�黹��</div></a></li>
                <li class="demo_li"><a href="#" id="mybook" title="���������ͼ��Ӵ"><div><i class="fa fa-bookmark"></i></div><div>�ҵ�ͼ��</div></a></li>
                <li class="demo_li"><a href="#" id="advise" title="����ʲô�õĽ�(fu)��(li)��"><div><i class="fa fa-comment"></i></div><div>���л�˵</div></a></li>
                <li class="demo_li"><a href="#" id="group" title="����������������¾���"><div><i class="fa fa-group"></i></div>��˵�еĳ�Ա<div></div></a></li>
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
        	    title:'<style>.tt{font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">��Ϣ</div>',
        	    dialog: {
        	        msg: '<style>.m{padding-left:5px;text-align:center;font-family:"΢���ź�";font-size:1.3em;}</style><div class="m">�˳�Ӧ��?</div>',
        	        btns: 2,                    
        	        type: -1,
        	        btn: ['�ǵ�','��'],
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
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">������Ϣ</div>',
        	    border: [0],
        	    shade: [0.1,'#fff'],
        	    offset: ['20px','330px'],
        	    area: ['600px','500px'],
        	    iframe: {src: 'getuserinfo'}
        	}); 
        };
        $("#user").on("click",userinfo);
        
        /*�޸�����*/
        var pass = function(){
        	var index = $.layer({
        		type: 2,
        	    maxmin: true,
        	    shadeClose: true,
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">�޸�����</div>',
        	    border: [0],
        	    shade: [0.1,'#fff'],
        	    offset: ['105px','330px'],
        	    area: ['400px','290px'],
        	    iframe: {src: 'updatepass.jsp'}
        	});
        };
        $("#updatepass").on("click",pass);
       
        /*��������*/
        var advise = function(){
        	var index = $.layer({
        		type: 2,
        	    maxmin: true,
        	    shadeClose: true,
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">��������</div>',
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
        	    title: '<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">����ͼ��</div>',
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
        		title:'<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">����ͼ��</div>',
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
        		title:'<style>.tt{padding-left:90px; font-weight:bold;text-align:center; color:#34495e; font-family:"΢���ź�";font-size:1.3em}</style><div class="tt">�黹ͼ��</div>',
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
