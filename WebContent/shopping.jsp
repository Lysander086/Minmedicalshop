<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/buttons.css" rel="stylesheet" type="text/css">
<link href="css/mycss.css" rel="stylesheet" type="text/css">
<title>menu</title>
</head>
<body>
<%
  String webname=request.getParameter("webname");
%>
<div class="container" style="margin-top:2%">


       <p style="float:left">您好,<%=webname%></p>
       <button class="btn btn-default" onclick="location.href='myindex.jsp'" style='float:right'>退出</button>
       <hr>
          
          <h3><label style="float:right">您是我们的第<button type="button" class="btn btn-default"><p id="ppp"></button>位访客，welcome!!</label></h3>
       <div style="margin-top:15%">
       <button type="button" class="btn btn-default" onclick="medi()">查看药品</button><br><br>
       <button type="button" class="btn btn-default" onclick="myorder()">我的订单</button><br><br>
       <button type="button" class="btn btn-default" onclick="contect()">联系我们</button><br><br>
       <button type="button" class="btn btn-default" onclick="myinfo()" >我的资料</button> <br><br>
        </div>
           <img src="css/image/jiaonang2.jpg" alt="..." class="img-circle" width=50% style="float:right;margin:-4% 0 0 5%">
 </div>
 <script>
     <%
         out.print("var webname='"+webname+"';");
     %>

   function medi(){
	  location.href="menu/medicine.jsp?webname="+webname;
	  }
   function myorder(){
	   location.href="menu/myorder.jsp?webname="+webname;
      }
   function myinfo(){
	   location.href="menu/myinformation.jsp?webname="+webname;
      }
   function contect(){
	   location.href="menu/contectus.jsp?webname="+webname;
      }
 </script>
   
   
   <script type="text/javascript">
    var caution=false
    function setCookie(name,value,expires,path,domain,secure)
    {
        var curCookie=name+"="+escape(value) +
                ((expires)?";expires="+expires.toGMTString() : "") +
                ((path)?"; path=" + path : "") +
                ((domain)? "; domain=" + domain : "") +
                ((secure)?";secure" : "")
        if(!caution||(name + "=" + escape(value)).length <= 4000)
        {
            document.cookie = curCookie
        }
        else if(confirm("Cookie exceeds 4KB and will be cut!"))
        {
            document.cookie = curCookie
        }
    }
    function getCookie(name)
    {
        var prefix = name + "="
        var cookieStartIndex = document.cookie.indexOf(prefix)
        if (cookieStartIndex == -1)
        {
            return null
        }
        var cookieEndIndex=document.cookie.indexOf(";",cookieStartIndex+prefix.length)
        if(cookieEndIndex == -1)
        {
            cookieEndIndex = document.cookie.length
        }
        return unescape(document.cookie.substring(cookieStartIndex+prefix.length,cookieEndIndex))
    }
    function deleteCookie(name, path, domain)
    {
        if(getCookie(name))
        {
            document.cookie = name + "=" +
                    ((path) ? "; path=" + path : "") +
                    ((domain) ? "; domain=" + domain : "") +
                    "; expires=Thu, 01-Jan-70 00:00:01 GMT"
        }
    }
    function fixDate(date)
    {
        var base=new Date(0)
        var skew=base.getTime()
        if(skew>0)
        {
            date.setTime(date.getTime()-skew)
        }
    }
    var now=new Date()
    fixDate(now)
    now.setTime(now.getTime()+365 * 24 * 60 * 60 * 1000)
    var visits = getCookie("counter")
    if(!visits)
    {
        visits=1;
    }
    else
    {
        visits=parseInt(visits)+1;
    }
    setCookie("counter", visits, now)
    document.getElementById("ppp").innerHTML=visits;
</script>
</body>
</html>