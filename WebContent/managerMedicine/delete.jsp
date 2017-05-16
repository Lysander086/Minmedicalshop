<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.medicine" %>       
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
    <%
       String mmid=request.getParameter("mid"); 
       medicine m=new medicine();
       int id=Integer.parseInt(mmid);
       m.doDelete(id);
    %>
</script>
</body>
</html>