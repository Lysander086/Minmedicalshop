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
      String custom_name=request.getParameter("custom_name");
      String m_name=request.getParameter("m_name");
      String outprice=request.getParameter("outprice");
      double oprice=Double.parseDouble(outprice);
      shopcardb s=new shopcardb();
      s.doCreate(custom_name,m_name,oprice);
   %>
</body>
</html>