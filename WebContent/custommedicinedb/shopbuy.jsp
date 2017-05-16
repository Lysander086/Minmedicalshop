<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.shopcardb" %>     
<%@ page import="db.uorder" %>   
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
   /* uorder u=new uorder();
    u.findLast();
    out.print(u.list.get(0).id);*/
       String webname=request.getParameter("webname");
       String time=request.getParameter("time");
       String str=request.getParameter("str");
       String sumprice=request.getParameter("sumprice");
       String [] Arr= str.split(",");
       shopcardb[] arr=new shopcardb[Arr.length];
       uorder[] arr2=new uorder[Arr.length];
       double sump=Double.parseDouble(sumprice);
       new uorder().doCreate(time, webname, sump);               //建立uorder对象，新建用户订单。
       uorder u=new uorder();
	   u.findLast();            //建立与订单表的连接  ,查询出用户订单ID，作为用户订单中药品的key。
       for(int i=0;i<Arr.length;i++){
    	   arr[i]=new shopcardb();                             //建立shopcardb对象，为了查询购物车药品及数量
    	   arr[i].findById(Integer.parseInt(Arr[i]));   //查询出用户药品及数量。                
    	   new uorder().doCreate2(u.list.get(0).id, arr[i].list.get(0).m_name, arr[i].list.get(0).m_number);
    	   new medicine().doUpdate(arr[i].list.get(0).m_name, arr[i].list.get(0).m_number);
       }
    %>
 </script>
</body>
</html>