<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/buttons.css" rel="stylesheet" type="text/css">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
<link href="css/background.css" rel="stylesheet" type="text/css">
<title>后台管理</title>
</head>
<body>
<script>
<%
  String webname=request.getParameter("webname");
  out.print("var webname='"+webname+"';");
%>
function inmmanage(){
	location.href="managemenu/minorder.jsp?webname="+webname;
}
</script>
<div class="container" style="margin-top:2%">
<button class="button button-primary button-rounded button-small">后台管理界面</button>
<button class="btn btn-default" onclick="location.href='myindex.jsp'" style='float:right'>退出</button>
<hr>
       <a type="button" class="btn btn-default" href="managemenu/medicineinfo.jsp">查看药品</a><br><br>
              <a type="button" class="btn btn-default" onclick="inmmanage()">进货管理</a><br><br>
       <a type="button" class="btn btn-default" href="managemenu/supplyinfo.jsp">供应商信息</a><br><br>
        <a type="button" class="btn btn-default" href="managemenu/profit.jsp">利润查看</a><br><br>
       <a type="button" class="btn btn-default" href="managemenu/changeuserdate.jsp">用户资料管理</a><br><br>
       <a type="button" class="btn btn-default" href="managemenu/manageinfo.jsp">修改管理员资料</a>
</div>
</body>
</html>