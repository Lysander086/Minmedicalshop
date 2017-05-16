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
       String webname=request.getParameter("webname");
       String name=request.getParameter("name");
       String password=request.getParameter("password");
       user u=new user();
       u.doUpdate(webname,name,password);
     %>
</body>
</html>