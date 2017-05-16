<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.medicine" %>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加药</title>
</head>
<body>
    <%
      String name=request.getParameter("mname");
      String outprice=request.getParameter("moutprice");
      String number=request.getParameter("mnumber");
      String production=request.getParameter("mproduction");
      String quality=request.getParameter("mquality");
      String kind=request.getParameter("mkind");
      String supply=request.getParameter("msupply");
      String inprice=request.getParameter("minprice");
      double op=Double.parseDouble(outprice);
      int nu=Integer.parseInt(number);
      double ip=Double.parseDouble(inprice);

      medicine m=new medicine();
      try{
    	  m.doCreate(name,op,nu,production,quality,kind,supply,ip);
      }catch(Exception e){
    	  e.printStackTrace();
      }     
    %>
</body>
</html>