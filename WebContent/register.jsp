<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.user" %>  
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/buttons.css" rel="stylesheet" type="text/css">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
<link href="css/background.css" rel="stylesheet" type="text/css">
<title>注册</title>
</head>
<body>
<div class="container" style="margin-top:2%">

    <button type="button" onclick="history.go(-1)" class="button button-primary button-rounded button-small">返回主页</button>
<hr>
    <form method="post">
    <div id="body">
    <div class="col-xs-4" style="float:left">
    <div class="form-group has-success"><input class="form-control" type="text" id="webname" name="webname" class="form-control" style="margin-top:2%;" placeholder="用户名"></div>
    <input type="text" id="logname" name="logname" class="form-control" style="margin-top:2%;" placeholder="name">
    <input type="password" id="logpass" name="logpass" class="form-control" style="margin-top:1%;" placeholder="password">
         <button  class="button button-primary button-rounded button-small"  type="submit" onclick="" style="margin-top:1%">注册</button>
    </div>
    </div>
    </form>
    </div>
<script>
    <%
      String name=request.getParameter("logname");
      String password=request.getParameter("logpass");
      String webname=request.getParameter("webname");
      if(name!=null&&password!=null&&webname!=null){ 
           user u=new user();
 	  try {
			if(u.doCreate(name,password,webname)==true){
				out.print("alert('注册成功！');");
				out.print("history.go(-1);");
			}
		 } catch (Exception e) {
			// TODO Auto-generated catch block
		 	e.printStackTrace();
		 }
      }
    %>
 </script>
</body>
</html>