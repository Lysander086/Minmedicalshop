<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.user" %>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<title>个人信息</title>
</head>
<body>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button>
<hr>
    <div class="col-xs-4" style="float:left">
        用户名：<input type="text" id="userwebname" class="form-control" placeholder="webname" readonly><br>
    您的账号：<input type="text" id="username" readonly class="form-control"><br>
    密码：<input type="text" id="userpassword" class="form-control" placeholder="password" readonly>
     <button onclick="thischange()" class="button button-primary button-rounded button-small" style="margin-top:3%">点击修改信息</button>
       <button onclick="save()" id="save" class="button button-primary button-rounded button-small" style="margin-top:3%;visibility:hidden" >保存</button>
    </div>
   
  <script>
  function thischange(){
	 // document.getElementById("userwebname").readOnly=false;
	  document.getElementById("userpassword").readOnly=false;
	  document.getElementById("save").style.visibility="visible";
  }
    <%
    String webname=request.getParameter("webname");
    user u=new user();
    u.findByWebname(webname);
    out.print("var webname='"+u.webname+"';");
    out.print("var name='"+u.name+"';");
    out.print("var password='"+u.password+"';");
    %>
    document.getElementById("userwebname").value=webname;
    document.getElementById("username").value=name;
    document.getElementById("userpassword").value=password;
    function save(){
        var a1=document.getElementById("userwebname").value;
        var a2=document.getElementById("username").value;
        var a3=document.getElementById("userpassword").value;
        
        $.ajax({
  		  type:"post",
  		  url:"../userdb/userinfosave.jsp",
  	      data:{"webname":a1,"name":a2,"password":a3},
  	      success:function(){{alert("修改成功");location.href="myinformation.jsp?webname="+webname;}      
  		    },
  	      dataType:"text"
  	   });
    }
  </script> 
  </div>
</body>
</html>