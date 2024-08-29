package com.dao;

import java.sql.*;

public class ConnectionDao 
{
	//getConnectionClubs() method returns connection obj
	public static Connection getConnectionClubs()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/clubs?useSSL=false", "root", "Welcome*123"); //connection to clubs database
			return con;
		}
		catch(Exception e)
		{	
			logActivity("ConnectionDao Exception: "+e);	
			return null;
		}
	}
	
	public static void logActivity(String msg)
	{
		System.out.println("["+msg+"]");
	}
	
}
