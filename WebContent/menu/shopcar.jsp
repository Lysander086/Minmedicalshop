<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.shopcardb" %>    
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/buttons.css" rel="stylesheet" type="text/css">
<link href="../css/mycss.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.min.js"></script>
<title>购物车</title>
</head>
<body>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回药品页</button>
<hr>
 <%
    String webname=request.getParameter("webname");
    shopcardb s=new shopcardb();
    s.findByName(webname);
    out.print("<table border='1' class='table'>");
    out.print("<tr><th>药名</th><th>售价</th><th>数量</th><th>从购物车中删除</th></tr>");
    for(int i=0;i<s.list.size();i++){
    	 out.print("<tr value="+'"'+s.list.get(i).id+'"'+">"+
    	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' readonly value="+'"'+s.list.get(i).m_name+'"'+"></td>"+
    	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' readonly value="+'"'+s.list.get(i).outprice+'"'+"></td>"+
    	           "<td><input name="+'"'+s.list.get(i).id+'"'+" class='mdata' list='url_list' value="+'"'+s.list.get(i).m_number+'"'+" placeholder='请输入数量' onchange='cal(this)'>"+
    	           "</td>"+
    			   "<td><button onclick='delfromcar(this)' name='buttons' class='button button-primary button-square button-small' type='button' id="+'"'+s.list.get(i).id+'"'+" value="+'"'+s.list.get(i).id+'"'+">-</button></td>"+
    			   "</tr>");
    }
    out.print("</table>");
 %>
 <p>总价：<span id="sumprice"></span></p>
 <button type="button" class="button button-primary button-rounded button-small" onclick="buy()">购买</button>
 </div>
<script>
<%
out.print("var webname='"+webname+"';");
%>
   function delfromcar(index){
	   $.ajax({
		   type:"post",
		   url:"../custommedicinedb/delfromshop.jsp",
		   data:{"shopid":index.value},
		   success:function(){{alert("已删除");location.href='shopcar.jsp?webname='+webname;}
		    },
		   dataType:"text"
	   });
   }
   var sumprice=0;
   
   function cal(index){
	   var pri=document.getElementsByName(index.name); 
	   sumprice+=index.value*pri[1].value;
	   document.getElementById("sumprice").innerHTML=sumprice;
	   $.ajax({
		   type:"post",
		   url:"../SupplyAndOrder/shopmedinum.jsp",
		   data:{"id":index.name,"number":index.value},
		   dataType:"text"
	   });
   }
   
   function buy(){
	   var whereid=document.getElementsByName("buttons");
	   var arr=new Array();
	   for(var i=0;i<whereid.length;i++){
		   arr.push(whereid[i].value)
	   }
	   var str=arr.join(",");
  	   var time=new Date();
	   var timenow=time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+":"+time.getMinutes();
	   if(window.confirm("确认购买")){
	   $.ajax({
		   type:"post",
		   url:"../custommedicinedb/shopbuy.jsp",
		   data:{"time":timenow,"webname":webname,"str":str,"sumprice":sumprice},
		   success:function(){{alert("购买成功");}
		   },
		   dataType:"text"
	   });
	   
	   }
   }
</script>
           <datalist id="url_list">
    	           <option label="1" value="1" />
    	           <option label="2" value="2" />
    	           <option label="3" value="3" />
    	           <option label="4" value="4" />
    	           <option label="5" value="5" />
    	           <option label="6" value="6" />
    	           <option label="7" value="7" />
    	           <option label="8" value="8" />
           </datalist>
</body>
</html>