package com.javadiscover.login;


import java.io.*; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



public class RegisterUser {
	 
	 public boolean registernewuser(String meterid, String name, String uemail, String address, String phonenum, String area, String city, String pin){
	  boolean flag = false;
	  Connection con = null;
	  try{
	   con = createConnection();
	   if(con != null){
	    
	    String queryString = "INSERT INTO userinfo(meter_id, name, email, address, phonenum, city, area, pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    java.sql.PreparedStatement pstatement = con.prepareStatement(queryString);
	    pstatement.setString(1, meterid);
	    pstatement.setString(2, name);
	    pstatement.setString(3, uemail);
	    pstatement.setString(4, address);
	    pstatement.setString(5, phonenum);
	    pstatement.setString(6, area);
	    pstatement.setString(7, city);
	    pstatement.setString(8, pin);
	    
	   int eu = pstatement.executeUpdate();
	   String qry="INSERT INTO billing(meter_id)VALUES(?)";
	   pstatement = con.prepareStatement(qry);
	    pstatement.setString(1, meterid);
	    int eu1=pstatement.executeUpdate();
	    
	     qry="INSERT INTO hourdata(meter_id)VALUES(?)";
		   pstatement = con.prepareStatement(qry);
		    pstatement.setString(1, meterid);
		    int eu2=pstatement.executeUpdate();
		    
		    qry="INSERT INTO login(meter_id, password)VALUES(?,?)";
			   pstatement = con.prepareStatement(qry);
			    pstatement.setString(1, meterid);
			    pstatement.setString(2, meterid);
			    int eu3=pstatement.executeUpdate();
			    
			     qry="INSERT INTO minvalues(meter_id)VALUES(?)";
				   pstatement = con.prepareStatement(qry);
				    pstatement.setString(1, meterid);
				    int eu4=pstatement.executeUpdate();
				    
				    qry="INSERT INTO peakntotal(meter_id)VALUES(?)";
					   pstatement = con.prepareStatement(qry);
					    pstatement.setString(1, meterid);
					    int eu5=pstatement.executeUpdate();
					    
					    
	    
	    if(eu==1 && eu1==1 && eu2==1 && eu3==1 && eu4==1 && eu5==1){
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

