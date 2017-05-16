<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.morder" %>    
<%@ page import="db.uorder" %> 
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<title>利润管理</title>
</head>

<body>

    <div class="container" style="margin-top:2%">
<button class="btn btn-warning" onclick="history.go(-1)" >返回</button>
<hr>
<div style="width:80%">
<div style="float:left">
<%
double summ=0;
   morder m=new morder();
   m.findAll();
  for(int i=0;i<m.list.size();i++){
	   summ+=m.list.get(i).sumprice;
   }
   out.print("<p>进货支出记录：</p>");
   out.print("<table class='table table-bordered'>");
   out.print("<tr><th>日期</th><th>总价（元）</th></tr>");
   
   for(int i=0;i<m.list.size();i++){
   	 out.print("<tr>"+
   	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).date+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).sumprice+'"'+"></td>"+

   			   "</tr>");
   }
   out.print("<tr><td>总支出：</td><td>");
   out.print(summ);
   out.print("</td></tr>");
   out.print("</table>");
%>
</div>
<div style="float:right">
  <%
   int summm=0;
    uorder u=new uorder();
  u.findAll();

  for(int i=0;i<u.list.size();i++){
	   summm+=u.list.get(i).sumprice;
  }

  out.print("<p>用户购物记录：</p>");
   out.print("<table class='table table-bordered'>");
   out.print("<tr><th>日期</th><th>总价（元）</th></tr>");
   
   for(int i=0;i<u.list.size();i++){
   	 out.print("<tr>"+
   	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).date+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).sumprice+'"'+"></td>"+

   			   "</tr>");
   }
   out.print("<tr><td>总收入：</td><td>");
   out.print(summm);
   out.print("</td></tr>");
   out.print("</table>");
   %>
</div>
</div>

</div>
</body>
</html>