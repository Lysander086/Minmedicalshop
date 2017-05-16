<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.morder"%>      
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<title>进货订单</title>
</head>
<body>
<%
  morder m=new morder();
  m.findAll();
%>
  <div class="container" style="margin-top:2%">
  <button onclick="history.go(-1);" class="btn btn-warning">返回</button>
   <hr>
       <%out.print("<table class='table'>");
	    out.print("<tr><th>订单编号</th><th>日期</th><th>供应商</th><th>药品名字</th><th>数量</th><th>总价</th><th>管理员</th></tr>");
	    
	    for(int i=0;i<m.list.size();i++){
	    	 out.print("<tr>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).id+'"'+" readonly></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).date+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).supplyname+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).medicine+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).m_number+'"'+"></td>"+
	    	    	   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).sumprice+'"'+"></td>"+
	    	    	   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).managename+'"'+"></td>"+	    			  
	    			   "</tr>");
	    	 }
	    out.print("</table>");
	    %>
   
   </div>
</body>
</html>