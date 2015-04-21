<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>需求状态查询</title>
<style type="text/css">
<!--
.STYLE10 {color: #FFFFFF; font-weight: bold; font-size: large; }
.STYLE5 {font-family: "Times New Roman", Times, serif}
.STYLE17 {color: #0000CC; font-weight: bold; font-size: large; }
-->
</style>
</head>

<body>
<!-- 加载Oracle数据库 -->
<%
      Connection ct=null;
      PreparedStatement sm=null;
      ResultSet rs=null;
	  
    	     try{	
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		Connection ct=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","lzs0726");
		
                    } catch (Exception e) {	   		
	   		e.printStackTrace();
	   	    }
%>

<table width="1296" border="1">
  <tr bgcolor="#CCCC99">
    <td height="80" colspan="6">&nbsp;</td>
  </tr>
  <tr bgcolor="#0099FF">
    <td width="198" height="41" bordercolor="#00FF00"><div align="center" class="STYLE10"><span class="STYLE5">网站首页</span></div></td>
    <td width="206" bordercolor="#00FF00"><div align="center" class="STYLE10"><span class="STYLE5">公司介绍</span></div></td>
    <td width="193" bordercolor="#00FF00"><div align="center" class="STYLE10"><span class="STYLE5">使用指南</span></div></td>
    <td width="194" bordercolor="#00FF00"><div align="center" class="STYLE10"><span class="STYLE5">手机平台</span></div></td>
    <td width="206" bordercolor="#00FF00"><div align="center" class="STYLE10"><span class="STYLE5">工具介绍</span></div></td>
    <td width="259" bordercolor="#00FF00"><div align="center" class="STYLE10"><span class="STYLE5">联系我们</span></div></td>
  </tr>
</table>

<%
   int pageSize=4;
   int pageNow=1;
   int rowCount=0;
   int pageCount=0;
   Connection ct=null;
   PreparedStatement sm=null;
   ResultSet rs=null;
   
   //接收用户希望显示的页数

   String s_pageNow=request.getParameter("pageNow");
   if(s_pageNow!=null){
       pageNow=Integer.parseInt(s_pageNow);
      }   
		try{	
	    sm=ct.prepareStatement("select count(*) from student");
		rs=sm.executeQuery();
		if(rs.next()){
	              rowCount=rs.getInt(1);	      			 
		}

                if(rowCount%pageSize==0) 
                  {
                     pageCount=rowCount/pageSize;
              
                   }else{
                     pageCount=rowCount/pageSize+1;
                        }                                        
        %>
  
  <table border="1" bgcolor="">
    <tr bgcolor="yellow">
      <td width="184">RedmineID</td> 
      <td width="192">Project</td> 
      <td width="193">Version</td> 
      <td width="194">Platform</td> 
      <td width="174">Author</td> 
      <td width="155"> UpdateTime </td> 
      <td width="167">StatusValue</td> 
    </tr> 

    <%
               sm=ct.prepareStatement("select * from(select a1.*,rownum rn from (select * from student) a1 where rownum<="+(pageNow * pageSize)+" ) where rn>"+((pageNow-1) * 
			   pageSize)+" ");                        
               rs=sm.executeQuery();                  
               while(rs.next()){                           
    %>
	
	 <tr><td><%=rs.getString(1)%></td> <td><%=rs.getString(2)%></td> <td><%=rs.getString(3) %></td> 
             <td><%=rs.getString(4) %></td> <td><%=rs.getString(5) %></td> <td><%=rs.getString(6) %></td>        
             <td><%=rs.getString(7) %></td>
	 </tr>
   <%
      }
   %>
</table>
    
	
   <div align="center">
     <%
        } catch (ClassNotFoundException e) {  		
   		e.printStackTrace();
    	} catch (SQLException e) {
		
		e.printStackTrace();
	    }finally{
                if(rs!=null){
                     rs.close();
                 }
                if(sm!=null){
                     sm.close();
                 }
                if(ct!=null){
                     ct.close();
                 }
                }
   %>
   

     <br>

     <%
    if(pageNow!=1)
       {
         out.print("<a href=welcome.jsp?pageNow="+(pageNow-1)+">上一页</a>");
        }        
    
    for(int i=pageNow;i<=(pageNow+pageSize-1);i++)
       {
       out.println("<a href=welcome.jsp?pageNow="+i+">["+i+"]</a>");
        }

    if(pageNow!=rowCount)
       {
         out.print("<a href=welcome.jsp?pageNow="+(pageNow+1)+">下一页</a>");
        }
  %>
  
     <br>  
   跳转页数：
   <input type="text" name="page"> 
   <a href=welcome.jsp>go</a>
   <br>
   
   </div>
   <hr>
</center>


</body>
</html>
