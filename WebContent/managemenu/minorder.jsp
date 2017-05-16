<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.medicine"%>   
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<title>进货管理</title>
</head>
<body>
<%
   medicine m=new medicine();
   m.findAll();
    out.print("<datalist id='medicine'>");
    for(int i=0;i<m.list.size();i++){
    	out.print("<option value='"+m.list.get(i).id+"'  label='"+m.list.get(i).name+"'>");
    }
    out.print("</datalist>");
    
    out.print("<datalist id='kind'>");
    for(int i=0;i<m.list.size();i++){
    	out.print("<option   value='"+m.list.get(i).kind+"'>");
    }
    out.print("</datalist>");
    
    out.print("<datalist id='supply'>");
    for(int i=0;i<m.list.size();i++){
    	out.print("<option  value='"+m.list.get(i).supplyname+"'>");
    }
    out.print("</datalist>");
    
    
%>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button>
<button onclick="minorder()" class="btn btn-warning">进货订单</button>
   <hr>
     <div class="col-xs-4" style="float:left">
     <div class="form-group has-success">
     <p>选择药品类型:</p>
     <select id="mkind" class="form-control" onchange="choose()"  style="text-align:center">
     <option>新药品</option>
     <option>已有药品</option>
     </select>
     </div><br><br>
           <input class="btn btn-info" type="text" value="提交" onclick="inm()">
     </div>

      <div class="col-xs-4">
      <input class="form-control" type="text" id="name" list="medicine" placeholder="输入药名"><br><br>
      <input class="form-control" type="text" id="number" placeholder="数量"><br><br>
      <div id="choose">
      <input class="form-control" type="text" id="outprice" placeholder="售价"><br><br>
      <input class="form-control" type="text" id="production" placeholder="生产日期"><br><br>
      <input class="form-control" type="text" id="quality" placeholder="保质期"><br><br>
      <input class="form-control" type="text" id="kinds" placeholder="种类" list='kind'><br><br>
      <input class="form-control" type="text" id="supplys" placeholder="供应商" list='supply'><br><br>
      <input class="form-control" type="text" id="inprice" placeholder="进价"><br></div>

      </div>

   </div>
   <script>
   <%
   String webname=request.getParameter("webname");
   out.print("var webname='"+webname+"';");

  %>
     function choose(){
    	 var judgekind=document.getElementById("mkind").value;
    	 if(judgekind=="已有药品"){
    		 document.getElementById("name").placeholder="输入药品ID";
    		 document.getElementById("choose").style.visibility="hidden";
		 }
    	 if(judgekind=="新药品"){
    		 document.getElementById("name").placeholder="输入药名";
    		 document.getElementById("choose").style.visibility="visible";

    	 }

     }
     function minorder(){
    	 location.href="inorderpage.jsp";
     }
     function inm(){
    	 var judgekind=document.getElementById("mkind").value;
    	 var id=document.getElementById("name").value;
    	 var outprice=document.getElementById("outprice").value;
    	 var number=document.getElementById("number").value;
    	 var production=document.getElementById("production").value;
    	 var quality=document.getElementById("quality").value;
    	 var kind=document.getElementById("kinds").value;
    	 var supply=document.getElementById("supplys").value;
    	 var inprice=document.getElementById("inprice").value;
    	 var time=new Date();
    	 var timenow=time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+"："+time.getMinutes();
    	 if(judgekind=="已有药品"){
			 $.ajax({						 
				    type: 'post',
				    url: "../SupplyAndOrder/manageminold.jsp" ,
				    data:{"webname":webname,"id":id,"number":number,"time":timenow},
				    success:function(){{alert('进药成功');location.href=('inorderpage.jsp');}
				    },
				    dataType: "text"
				 }); 
    	 }
    	 if(judgekind=="新药品"){
    		 alert(supply);
			 $.ajax({						 
				    type: 'post',
				    url: "../SupplyAndOrder/manageinm.jsp" ,
				    data:{"webname":webname,"id":id,"outprice":outprice,"number":number,"production":production,"quality":quality,"kind":kind,"supply":supply,"inprice":inprice,"time":timenow},
				    success:function(){{alert('进药成功');location.href=('inorderpage.jsp');}
				    },
				    dataType: "text"
				 }); 
    	 }
    	
     }
   </script>
</body>
</html>