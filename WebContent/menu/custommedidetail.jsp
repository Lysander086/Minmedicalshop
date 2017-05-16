<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.uorder" %>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<title>查看药品</title>
</head>
<body>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回</button>
<hr>

<%   
      String id=request.getParameter("id");

      int iid=Integer.parseInt(id);
      uorder u=new uorder();
      u.findByodId(iid);
      out.print("<table class='table table-bordered'>'");
      out.print("<tr><th>订单ID</th><th>药品</th><th>数量</th></tr>");
   
      for(int i=0;i<u.list2.size();i++){
    	 out.print("<tr>"+
   	           "<td><input name="+'"'+u.list2.get(i).orderid+'"'+" class='mdata' value="+'"'+u.list2.get(i).orderid+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+u.list2.get(i).orderid+'"'+" class='mdata' value="+'"'+u.list2.get(i).mediname+'"'+" readonly></td>"+
   	           "<td><input name="+'"'+u.list2.get(i).orderid+'"'+" class='mdata' value="+'"'+u.list2.get(i).medinum+'"'+" readonly></td>"+		 
   			   "</tr>");
   }
           out.print("</table>");
   %>
</div>
</body>
</html>