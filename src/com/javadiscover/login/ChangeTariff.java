package com.javadiscover.login;
import java.io.*; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ChangeTariff {
	
	public double[] showTariff()
	{
		 double[] tariff = new double[6]; // first 3 arr for peakhour tariff n next 3 for normal tariff
		 boolean flag = false;
		  Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry = "SELECT * FROM tariff";
		    ResultSet rs = stat.executeQuery(qry);
		   
		    if(rs.next()){
		     flag = true;
		     tariff[0] = rs.getDouble("peak30");
		     tariff[1] = rs.getDouble("peak70");
		     tariff[2] = rs.getDouble("peak100");
		     tariff[3] = rs.getDouble("normal30");
		     tariff[4] = rs.getDouble("normal70");
		     tariff[5] = rs.getDouble("normal100");
		    }
		   }
		  }catch (Exception e) {
		   e.printStackTrace();
		  }
		  finally{
		   if(con != null){
		    try {
		     con.close();
		    } catch (SQLException e) {
		     e.printStackTrace();
		    }
		   }
		  }
		  return tariff;	
	}
	
	public boolean changeTariff(double[] tariff)
	{
		boolean flag = false;
		  Connection con = null;
		  try{
		   con = createConnection();
		   String queryString= "";
		   if(con != null){
			 queryString=  "UPDATE tariff SET peak30=?,peak70=? , peak100=?,normal30=?,normal70=?,normal100=?";
		    java.sql.PreparedStatement pstatement = con.prepareStatement(queryString);
		    pstatement.setDouble(1, tariff[0]);
		    pstatement.setDouble(2, tariff[1]);
		    pstatement.setDouble(3, tariff[2]);
		    pstatement.setDouble(4, tariff[3]);
		    pstatement.setDouble(5, tariff[4]);
		    pstatement.setDouble(6, tariff[5]);
		    
		    
		    int eu = pstatement.executeUpdate();
		    if(eu==1){
		     flag = true;
		    }
		   }
		  }catch (Exception e) {
			   e.printStackTrace();
			  }finally{
			   if(con != null){
			    try {
			     con.close();
			    } catch (SQLException e) {
			     e.printStackTrace();
			    }
			   }
			  }
			  return flag;
			  
}
	
	 public Connection createConnection() {
		  System.out.println("Createung postgres DataBase Connection");
		  Connection connection = null;
		  String url = "jdbc:mysql://localhost:3306/smarthack";
		  String user = "root";
		  String pwd = "password";

		  try {
		   
		   // Provide database Driver according to your database
		  // Class.forName("org.postgresql.Driver");
		   Class.forName("com.mysql.jdbc.Driver").newInstance();
		   // Provide URL, database and credentials according to your database 
		  // connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/smarthack", "postgres","password");
		   	connection = DriverManager.getConnection(url, user, pwd);
		  } catch (Exception e) {
		   e.printStackTrace();
		   return null;
		  }
		  if(connection != null){
		   System.out.println("Connection created successfully....");
		  }
		  return connection;
		 }

}

