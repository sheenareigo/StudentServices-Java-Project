package com.dao;

import java.sql.*;

import javax.servlet.RequestDispatcher;
import com.entity.StudentEntity;

public class StudentLoginDao 
{
	public StudentEntity verify(String student_id, String password)
	{
		try
		{
			StudentEntity se = new StudentEntity();
			ConnectionDao.logActivity("StudentLoginDao verify(): "+student_id+", "+password);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("select * from students where student_id=? and password=?");
			pt.setString(1, student_id);
			pt.setString(2, password);
			ResultSet rs= pt.executeQuery();
			if(rs.next())
			{	
				se.setStudentid(rs.getInt(1));
				se.setFirst_name(rs.getString(2));
				ConnectionDao.logActivity("StudentLoginDao verify(): "+rs.getString(1)+", "+rs.getString(2));
				con.close(); 
				return se;
			}
			else
			{	
				con.close();
				return null;  
			}
		}
		catch(Exception e)
		{
			System.out.println("StudentLoginDao verify() Exception: "+e);
			return null;
		}
	}
	
}
