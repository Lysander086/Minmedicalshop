<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.user" %>      
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <%
     String uid=request.getParameter("id");
     String name=request.getParameter("name");
     String password=request.getParameter("password");
     String title=request.getParameter("title");
     String webname=request.getParameter("webname");
     int id=Integer.parseInt(uid);
     user u=new user();
     u.doUpdate(id,name,password,title,webname);
   %>
</body>
</html>