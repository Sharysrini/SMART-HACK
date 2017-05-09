package com.javadiscover.login;
  
import java.sql.*;  


public class ConnectionProvider {
	private static Connection connection=null;  
	static{  
	try{  
		 // Provide database Driver according to your database
		   Class.forName("org.postgresql.Driver");
		   connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/smarthack", "postgres","password");

	}catch (Exception e) {
		   e.printStackTrace();
		  } 
	}  
	  
	public static Connection getCon(){  
	    return connection;  
	}  
}
