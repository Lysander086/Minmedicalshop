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
<title>药品管理</title>
<script src="../js/jquery.min.js"></script>
</head>
<body>
<div class="container" style="margin-top:2%">
<button onclick="history.go(-1);" class="btn btn-warning">返回菜单</button>
   <hr>

        <% 
        medicine m=new medicine();
	    try {
	     	m.findAll();
	    } catch (Exception e) {
		  e.printStackTrace();
	    }
	    out.print("<table class='table table-bordered'>'");
	    out.print("<tr><th>编号</th><th>药名</th><th>售价</th><th>库存</th><th>生产日期</th><th>保质期</th><th>分类</th><th>厂家</th><th>进价</th><th>保存/删除</th></tr>");
	    
	    for(int i=0;i<m.list.size();i++){
	    	 out.print("<tr>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).id+'"'+" readonly></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).name+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).outprice+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).number+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).production+'"'+"></td>"+
	    	           "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).quality+'"'+"></td>"+    
	    			   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).kind+'"'+"></td>"+
	    			   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).supplyname+'"'+"></td>"+
	    			   "<td><input name="+'"'+m.list.get(i).id+'"'+" class='mdata' value="+'"'+m.list.get(i).inprice+'"'+"></td>"+
	    			   "<td>"+
	    			   "<button onclick='change(this)' class='button button-primary button-square button-small' value="+'"'+m.list.get(i).id+'"'+">save</button><button onclick='del(this)' class='button button-primary button-square button-small' value="+'"'+m.list.get(i).id+'"'+">del</button></td>"+
	    			   "</tr>");
	    }
	    out.print("<tr><td><input name='addd' class='mdata' value='此行添加药品' readonly style='color:red;'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><input class='mdata' name='addd'></td><td><button class='button button-primary button-square button-small' type='button' onclick='create()'>+</button></td>");
	    out.print("</table>");
	    %>

<script>                               
   function create(){
	   var addinfo=document.getElementsByName("addd");
	   if(window.confirm('确定添加')){
			 $.ajax({						 
				    type: 'post',
				    url: "../managerMedicine/createmedicine.jsp" ,
				    data:{"mname":addinfo[1].value,"moutprice":addinfo[2].value,"mnumber":addinfo[3].value,"mproduction":addinfo[4].value,"mquality":addinfo[5].value,"mkind":addinfo[6].value,"msupply":addinfo[7].value,"minprice":addinfo[8].value},
				    success:function(){{alert('添加成功');location.href=('medicineinfo.jsp');}
				    },
				    dataType: "text"
				 }); 
      }
   }
   function change(index){
	   var a=document.getElementsByName(index.value); 
	   if(window.confirm('确定修改')){
		   alert("您要修改的药品编号为："+a[0].value);
			 $.ajax({						 
				    type: 'post',
				    url: "../managerMedicine/changepage.jsp" ,
				    data:{"mid":a[0].value,"mname":a[1].value,"moutprice":a[2].value,"mnumber":a[3].value,"mproduction":a[4].value,"mquality":a[5].value,"mkind":a[6].value,"msupply":a[7].value,"minprice":a[8].value},
				    success:function(){{alert('已修改');location.href=('medicineinfo.jsp');}
				    },
				    dataType: "text"
				 }); 
        }
   }
   function del(index){
	  if(window.confirm('确定删除吗')){
			 $.ajax({		
				    type: 'POST',
				    url: "../managerMedicine/delete.jsp" ,
				    data:"mid="+index.value,
				    success:function(){{alert("已删除");location.href=('medicineinfo.jsp');}
				    },
				    dataType: "text"
				 });  
	  }
   }
</script>
</div>
</body>
</html>