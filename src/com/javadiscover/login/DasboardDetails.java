package com.javadiscover.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DasboardDetails {
	int user;
	int peakmin;
	int meterid;
	String name, area;
	int peakhour;
	double peakunit, unitsconsumed;
	int pincode;
	
	public DasboardDetails(int user)
	{
		this.user=user;
		getdashDetails();
		//System.out.println(user);
		//System.out.println(this.user);
	}
	
	public void getdashDetails()
	{	
		 boolean flag1 = false, flag2=false;
		  Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="SELECT * FROM peakntotal WHERE meter_id="+user+" ";//add date
		    ResultSet rs= stat.executeQuery(qry);
		    if(rs.next()){
			     flag2 = true;
			    peakunit=rs.getDouble("peakunit");
			     unitsconsumed=rs.getDouble("unitsconsumed");
			     peakhour=rs.getInt("peakhour");
			     peakmin=rs.getInt("peakmin");
			    }
		    qry = "SELECT * FROM userinfo WHERE meter_id= "+user+" ";
		    rs = stat.executeQuery(qry);
		   
		    if(rs.next()){
		     flag1 = true;
		     meterid=rs.getInt("meter_id");
		     name=rs.getString("name");
		     pincode=rs.getInt("pincode");
		     area=rs.getString("area");
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
	public String sendArea()
	{
		return area;
	}
	public int sendPin()
	{
		return pincode;
	}
	 public double sendPeak()
	 {
		 return peakunit;
	 }
	 public double sendUnit()
	 {		
		 return unitsconsumed;
	
	 }
	 public String sendTime()
	 {	String str=Integer.toString(peakhour)+":"+Integer.toString(peakmin);
	 	//System.out.println(str);
		 return(str);
	 }
	 public int totalUser()
	 {	
		 int count=0;
		 Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="SELECT COUNT(meter_id) FROM userinfo"; //add date
		    ResultSet rs= stat.executeQuery(qry);
		    rs.next();
		    count=rs.getInt(1);
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
		    return count;       
	 }
	 public double totalUnits(int req)
	 {
		 double sum=0.0, psum=0.0;
		 Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="SELECT SUM(unitsconsumed), SUM(peakunit) FROM peakntotal"; //add date
		    ResultSet rs= stat.executeQuery(qry);
		    rs.next();
		    sum=rs.getDouble(1);
		    psum=rs.getDouble(2);
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
		  if(req==1)
		    return sum;
		  else return psum;
	 }
	 
	 public int[] topFiveNormalUser()
	 {	
		 int[] topmeter_id = new int[5];
		 int count = 0;
		 Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="SELECT meter_id FROM peakntotal ORDER BY unitsconsumed DESC LIMIT 5"; //add date
		    ResultSet rs= stat.executeQuery(qry);
		    while(rs.next())
		    topmeter_id[count++] = rs.getInt("meter_id");	
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
		    return topmeter_id;       
	 }
	 public int[] topFivePeakUser()
	 {	
		 int[] topmeter_id = new int[5];
		 int count = 0;
		 Connection con = null;
		  try{
		   con = createConnection();
		   if(con != null){
		    Statement stat = con.createStatement();
		    String qry="SELECT meter_id FROM peakntotal ORDER BY peakunit DESC LIMIT 5"; //add date
		    ResultSet rs= stat.executeQuery(qry);
		    while(rs.next())
		    topmeter_id[count++] = rs.getInt("meter_id");	
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
		    return topmeter_id;       
	 }
	 
	 public Connection createConnection() {
		  System.out.println("Createing mysql workbench DataBase Connection");
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
