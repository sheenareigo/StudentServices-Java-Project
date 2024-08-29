package com.dao;

import java.sql.*;

import javax.servlet.RequestDispatcher;

public class CoordinatorLoginDao 
{
	public boolean verify(String username, String password)
	{
		try
		{
			ConnectionDao.logActivity("CoordinatorLoginDao verify(): "+username+", "+password);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("select * from coordinator where id=? and password=?");
			pt.setString(1, username);
			pt.setString(2, password);
			ResultSet rs= pt.executeQuery();
			if(rs.next())
			{	
				ConnectionDao.logActivity("CoordinatorLoginDao verify(): "+rs.getString(1)+", "+rs.getString(2));
				con.close();
				return true;   
			}
			else
			{	
				con.close();
				return false;  
			}
		}
		catch(Exception e)
		{
			System.out.println("CoordinatorLoginDao verify() Exception: "+e);
			return false;
		}
	}
	
}