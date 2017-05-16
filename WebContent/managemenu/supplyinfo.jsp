<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.supply" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<title>供应商信息</title>
</head>
<body>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button>
   <hr>
   <%
   supply s=new supply();
   s.findAll();
   out.print("<table class='table'>");
   out.print("<tr><th>编号</th><th>厂家名称</th><th>地址</th><th>联系方式</th></tr>");
   
   for(int i=0;i<s.list.size();i++){
   	 out.print("<tr>"+
   	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' value="+'"'+s.list.get(i).id+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' value="+'"'+s.list.get(i).name+'"'+"></td>"+
   	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' value="+'"'+s.list.get(i).address+'"'+"></td>"+
   	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' value="+'"'+s.list.get(i).telphone+'"'+"></td>"+ 			 
   			   "</tr>");
   	 }
   out.print("</table>");
   %>
   </div>
</body>
</html>