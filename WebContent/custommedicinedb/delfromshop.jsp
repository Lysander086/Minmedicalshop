<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.shopcardb" %>        
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%  
    
       String shopid=request.getParameter("shopid");
       int id=Integer.parseInt(shopid);
       shopcardb s=new shopcardb();
       s.doDelete(id);
    %>
</body>
</html>