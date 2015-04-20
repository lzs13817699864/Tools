<%@ page contentType="text/html; charset=gb2312" pageEncoding="gb2312" %>
<html>
<head>
     <script type="text/javascript" language="javascript"> 
<!--
     function check(form){
             with(form){
                 if(form1.name.value=="")
                     {

                   window.alter("姓名不能为空！")；
                    return false;
                                    }
                 if(form1.password.value==""){
                      
                    window.alter("密码不能为空！")；
                    return false; 
                                       }

                     }
             
                         }

 -->    
   </script>

</head>
<body bgcolor="pink">

<center>

<img src=imgs/04.PNG><br>
<hr>
<form name="form1" action="LoginServlet" method="post" onsubmit="return check(this);">
  <img src=imgs/01.PNG><br>
   <ul>
    <li> 姓名：<input type="text" name="name"></li>
    <li> 密码：<input type="text" name="password"></li>
    <br>
    <li><input type="submit" name="login" value="登陆"></li>
	  <input name="action" type="hidden" value="LOGIN">
   </ul>
</form>

<form name="form1" action="LoginServlet" method="post">
   <ul>
    <li><input type="submit" name="rigister" value="注册"></li>
	  <input name="action" type="hidden" value="RIGISTER">
   </ul>
</form>
<hr>

</center>

</body>
</html>