<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.medicine"%> 
<%@ page import="db.morder"%>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String webname=request.getParameter("webname");
String time=request.getParameter("time");
String name=request.getParameter("id");
String outprice=request.getParameter("outprice");
String number=request.getParameter("number");
String production=request.getParameter("production");
String quality=request.getParameter("quality");
String kind=request.getParameter("kind");
String supply=request.getParameter("supply");
String inprice=request.getParameter("inprice");
double op=Double.parseDouble(outprice);
int num=Integer.parseInt(number);
double ip=Double.parseDouble(inprice);
double sumprice=ip*num;
medicine m=new medicine();
m.doCreate(name, op, num, production, quality, kind, supply, ip);

morder mo=new morder();
mo.doCreate(time, supply, name, num, sumprice, webname);
%>
</body>
</html>