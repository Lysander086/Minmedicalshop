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
   String mid=request.getParameter("id");
   String m_number=request.getParameter("m_number");
   String number=request.getParameter("number");
   
   medicine m=new medicine();
   int num=Integer.parseInt(number);
   int id=Integer.parseInt(mid);
   m.findById(id);
   
   int n=(int)m.list.get(0).number;
   String supply=m.list.get(0).supplyname;
   String name=m.list.get(0).name;
   double sumprice=num*(m.list.get(0).inprice);
   n+=num;
   
   medicine mm=new medicine();
   mm.doUpdate(id,n);
   
   morder mo=new morder();
   mo.doCreate(time, supply, name, num, sumprice, webname);

   %>
</body>
</html>