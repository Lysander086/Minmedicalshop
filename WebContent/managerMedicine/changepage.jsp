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
       String id=request.getParameter("mid");
       String name=request.getParameter("mname"); 
       String outprice=request.getParameter("moutprice"); 
       String number=request.getParameter("mnumber"); 
       String production=request.getParameter("mproduction"); 
       String quality=request.getParameter("mquality"); 
       String kind=request.getParameter("mkind"); 
       String supply=request.getParameter("msupply"); 
       String inprice=request.getParameter("minprice"); 
       int i=Integer.parseInt(id);
       double outpri=Double.parseDouble(outprice);
       int num=Integer.parseInt(number);
       double inpri=Double.parseDouble(inprice);
       medicine m=new medicine();
       m.doUpdate(i,name, outpri, num, production, quality, kind, supply, inpri);
    %>
    </script>
</body>
</html>