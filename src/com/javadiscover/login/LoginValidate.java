package com.javadiscover.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginValidate {
 
 public boolean validateUserLogin(int name, String pwd){
  boolean flag = false;
  Connection con = null;
  try{
   con = createConnection();
   if(con != null){
    Statement stat = con.createStatement();
    String qry = "SELECT * FROM login WHERE meter_id = "+name+" AND password="+pwd+" ";
    ResultSet rs = stat.executeQuery(qry);
    if(rs.next()){
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