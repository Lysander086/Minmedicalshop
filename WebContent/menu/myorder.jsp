<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.uorder"%>  
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<title>我的订单</title>
</head>
<body>
<%   String webname=request.getParameter("webname"); %>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button> 
<hr>
<%
   uorder u=new uorder();
   u.findByName(webname);
   out.print("<table class='table table-bordered'>'");
   out.print("<tr><th>订单ID</th><th>订单日期</th><th>总价</th><th>查看药品</th></tr>");
   
   for(int i=0;i<u.list.size();i++){
   	 out.print("<tr>"+
   	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).id+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).date+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).sumprice+'"'+" readonly></td>"+
   			   "<td>"+
   			   "<button type='button' class='button button-primary button-square button-small' onclick='todetail(this)' value="+'"'+u.list.get(i).id+'"'+">+</button></td>"+
   			   "</tr>");
   }
   out.print("</table>");
   %>
<script>
  function todetail(index){   
location.href="custommedidetail.jsp?id="+index.value;

  }
</script>
</div>
</body>
</html>