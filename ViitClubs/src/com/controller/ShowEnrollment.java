package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ConnectionDao;
import com.dao.RegisterClubStudentDao;

@WebServlet("/showenrollment")
public class ShowEnrollment extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			RegisterClubStudentDao d2= new RegisterClubStudentDao();
		
			ConnectionDao.logActivity("showenrollment: ");
			
			RequestDispatcher rd= req.getRequestDispatcher("viewenrollment");			
			req.setAttribute("enrollment", d2.readAllEnrollment());
			rd.forward(req, res);
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowCustomerFeedbacks Exception: "+e);
		} 
	}
}

