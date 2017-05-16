<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.user" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/buttons.css" rel="stylesheet" type="text/css">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
<link href="css/background.css" rel="stylesheet" type="text/css">
<title>登录</title>
</head>
<body>
<div class="container" style="margin-top:2%">
   <div id="top">
      <button type="button"  class="button button-primary button-rounded button-small" onclick="jumreg()" >还没注册？Go！</button>
    </div>
<hr>
    <form method="post">     
    <div id="body">
    <div class="col-xs-4" style="float:left">
    <input type="text" id="logname" name="logname" class="form-control" placeholder="name">
    <input type="password" id="logpass" name="logpass"  class="form-control" style="margin-top:2%;" placeholder="password">
    </div>
    <div style="float：right">
    <button type="submit" class="button button-primary button-rounded button-small" style="margin:3.8% 0 0 3%;">登录</button>
    </div>
    </div>
    </form>

    <script>
    function jumreg(){
    	location.href="register.jsp";
    }

    </script>
    <script>
          <%
          String name=request.getParameter("logname");
          String password=request.getParameter("logpass");   
          if(name!=null&&password!=null){
          user u=new user();
     	    try {
     		if(u.findById(name)==true){
     		//out.print("alert("+'"'+password+' '+u.password+'"'+");");
     			if(u.password.equals(password)){
     				if(u.title.equals("manage")){
     					response.sendRedirect("managepage.jsp?webname="+u.webname);
     				}else
     					response.sendRedirect("shopping.jsp?webname="+u.webname);
     			}else{
     				out.print("alert('密码错误');");}
     		}else{
     			out.print("alert('用户名不存在');");}
     	} catch (Exception e) {

     		e.printStackTrace();
     	} }
          %>
          </script>
          </div>
</body>
</html>