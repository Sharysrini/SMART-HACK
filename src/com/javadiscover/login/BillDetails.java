package com.javadiscover.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BillDetails {
	
	int user;
	int meterid, month;
	double  total, totalpeak, cost ;
	String name,email;
	
	
	public BillDetails(int user)
	{
		this.user=user;
		getDetails();
		//System.out.println(user);
		//System.out.println(this.user);
	}
	
	public void getDetails()
	{	
		 boolean flag1 = false, flag2=false;
		  Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="SELECT * FROM billing WHERE meter_id="+user+" ";
		    ResultSet rs= stat.executeQuery(qry);
		    if(rs.next()){
			     flag2 = true;
			     month=rs.getInt("month");
			     total=rs.getDouble("total");
			     totalpeak=rs.getDouble("totalpeak");
			     cost=rs.getDouble("cost");
			    }
		    qry = "SELECT * FROM userinfo WHERE meter_id= "+user+" ";
		    rs = stat.executeQuery(qry);
		   
		    if(rs.next()){
		     flag1 = true;
		     meterid=rs.getInt("meter_id");
		     name=rs.getString("name");
		     email=rs.getString("email");
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
	}
		 
	public int sendMeter()
	{
		return meterid;
	}
	public String sendName()
	{
		return name;
	}
	public String sendEmail()
	{
		return email;
	}
	public int sendMonth()
	{
		return month;
	}
	public double sendTotal()
	{
		return total;
	}
	public double sendTotalPeak()
	{
		return totalpeak;
	}
	public double sendCost()
	{
		return cost;
	}
	public int payBill()
	{
		int flag = 0;
		  Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="UPDATE billing SET cost=0 WHERE meter_id="+user+" ";
		    flag=stat.executeUpdate(qry);
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
