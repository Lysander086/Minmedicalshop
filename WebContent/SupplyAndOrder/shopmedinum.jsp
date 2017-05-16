<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.shopcardb"%>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <%
     String id=request.getParameter("id");
      String number=request.getParameter("number");
     int i=Integer.parseInt(id);
      int n=Integer.parseInt(number);
      shopcardb s=new shopcardb();
      s.doUpdate(i,n);
   %>
</body>
</html>