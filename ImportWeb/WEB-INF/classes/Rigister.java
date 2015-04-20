package databasetest;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;  //需要导入servlet-api.jar [web 工程/lib/下面]
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Rigister extends HttpServlet{
	String ID="";
	String Name="";
	String Email="";
	String SQL="insert into User_Import values('"+ID+"','"+Name+"','"+Email+"')";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		  HttpSession session=req.getSession();
		  
		  try{
		  //提取客户端的信息
		   ID=req.getParameter("id");
		   ID=new String(ID.getBytes("ISO-8859-1"),"gb2312");
		   Name=req.getParameter("name");
		   Name=new String(Name.getBytes("ISO-8859-1"),"gb2312");
           Email=req.getParameter("email");
           Email=new String(Email.getBytes("ISO-8859-1"),"gb2312");
            
           //连接数据库
	        Connection con=new ConnDB().getConn();
			Statement sta=con.createStatement();
			int i=sta.executeUpdate(SQL);
			
		       if(i>0)
               {
		    	   //注册成功
	                RequestDispatcher rd=req.getRequestDispatcher("addSuc.jsp");
		            rd.forward(req,res);
                }
                else{
                	//注册失败
	                RequestDispatcher rd=req.getRequestDispatcher("addError.jsp");
		            rd.forward(req,res); 
                     }
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		super.doPost(req, res);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}
}
