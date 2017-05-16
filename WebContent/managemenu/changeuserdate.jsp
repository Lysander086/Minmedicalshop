<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.user" %>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<title>用户信息管理</title>
</head>
<body>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button>
   <hr>
		  <%
		     user u=new user();
		     u.findByTitle("custom");
		     out.print("<table class='table'>");
			    out.print("<tr><th>编号</th><th>账号</th><th>密码</th><th>头衔</th><th>用户名</th><th>保存/删除</th></tr>");
			    
			    for(int i=0;i<u.list.size();i++){
			    	 out.print("<tr>"+
			    	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).id+'"'+" readonly></td>"+
			    	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).name+'"'+" readonly></td>"+
			    	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).password+'"'+"></td>"+
			    	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).title+'"'+"></td>"+
			    	           "<td><input name="+'"'+u.list.get(i).id+'"'+" class='mdata' value="+'"'+u.list.get(i).webname+'"'+"></td>"+
			    			   "<td>"+
			    			   "<button onclick='change(this)' class='button button-primary button-square button-small' value="+'"'+u.list.get(i).id+'"'+">+</button> <button onclick='del(this)' class='button button-primary button-square button-small' value="+'"'+u.list.get(i).id+'"'+">-</button></td>"+
			    			   "</tr>");
			    	 }
			    out.print("</table>");
		  %>
		  </div>
		  <script>
		     function change(index){
		    	 if(window.confirm("确定修改")){
		    	 var info=document.getElementsByName(index.value);
		  	   $.ajax({
				   type:"post",
				   url:"../userdb/manageuserinfo.jsp",
				   data:{"id":info[0].value,"name":info[1].value,"password":info[2].value,"title":info[3].value,"webname":info[4].value},
				   success:function(){{alert("已修改");location.href=('changeuserdate.jsp');}
				    },
				   dataType:"text"
			   });
		     }}
		     function del(index){
		    	 if(window.confirm("确定删除")){
		    	 var info=document.getElementsByName(index.value);
		    	   $.ajax({
		    		   type:"post",
		    		   url:"../userdb/manageuserinfodel.jsp",
		    		   data:{"id":info[0].value},
		    		   success:function(){{alert("已删除");location.href=('changeuserdate.jsp');}
		    		    },
		    		   dataType:"text"
		    	   });
		     }}
		  </script>
</body>
</html>