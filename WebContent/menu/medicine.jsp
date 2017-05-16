<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.medicine" %>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<title>药品浏览</title>
</head>
<body>
        <%String webname=request.getParameter("webname");%>
<div class="container" style="margin-top:2%">

<p style="float:right">您好：<%=webname%></p>
<div style="float:left;margin-bottom:2%;">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button>
<button type="button" class="btn btn-info" onclick="toshopcar()">购物车</button>
</div>

<hr>
     
   <% 
        medicine m=new medicine();
	    try {
	     	m.findAll();
	    } catch (Exception e) {
		  e.printStackTrace();
	    }
	    out.print("<table class='table table-bordered'>'");
	    out.print("<tr><th>药名</th><th>售价</th><th>库存</th><th>生产日期</th><th>保质期</th><th>分类</th><th>生产厂家</th><th>加入购物车</th></tr>");
	    
	    for(int i=0;i<m.list.size();i++){
	    	 out.print("<tr>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).name+'"'+" readonly></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).outprice+'"'+" readonly></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).number+'"'+" readonly></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).production+'"'+" readonly></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).quality+'"'+" readonly></td>"+    
	    			   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).kind+'"'+" readonly></td>"+
	    			   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).supplyname+'"'+" readonly></td>"+
	    			   "<td>"+
	    			   "<button type='button' class='button button-primary button-square button-small' onclick='addtocar(this)' value="+'"'+m.list.get(i).id+'"'+">+</button></td>"+
	    			   "</tr>");
	    }
	    out.print("</table>");
	    %>
        
 </div>      
 <script>
 <%
   out.print("var webname='"+webname+"';");
  /* out.print("var shops=new Array();");
   out.print(" function addtocar(){");
   out.print("var checkbox=document.getElementsByClassName('check');");
   out.print("for(var i=0;i<checkbox.length;i++){");
   out.print("if(checkbox[i].checked==true){");
   out.print("shops.push(checkbox[i].value);"+
             "checkbox[i].checked=false;} }}");*/
 %>
          function toshopcar(){
           	    location.href="shopcar.jsp?webname="+webname;
           }
 function addtocar(index){
	 var a=document.getElementsByName(index.value);
	 $.ajax({
		  type:"post",
		  url:"../custommedicinedb/medicinedb.jsp",
	      data:{"custom_name":webname,"m_name":a[0].value,"outprice":a[1].value},
	      success:function(){{alert("添加成功");}
		    },
	      dataType:"text"
	   });
	 }

 
 </script>
    
</body>
</html>