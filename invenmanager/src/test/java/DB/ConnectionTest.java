package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionTest {
  
  public static void main(String[] args) throws SQLException {
	  String url = "jdbc:mysql://localhost:3306/invenmanager";
	  String user = "invenmanager";
	  String pwd = "inven";
	  Connection conn = DriverManager.getConnection(url, user, pwd);
	  if (conn != null) {
		  System.out.println("connection success");
		  PreparedStatement ps = conn.prepareStatement("SELECT * from user");
		  ResultSet rs =  ps.executeQuery();
		  rs.next();
		  System.out.println("id = " + rs.getString("id") + "\nname = " + rs.getString("name"));
	  }

  }
}
