import java.sql.*;
public class ConnDB {

	Connection con=null;
	
	public Connection getConn(){
 
	 
    	     try{
    	
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		Connection ct=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","lzs0726");
		
                    } catch (Exception e) {	   		
	   		e.printStackTrace();
	   	    }
		
		return con;
	}
}
