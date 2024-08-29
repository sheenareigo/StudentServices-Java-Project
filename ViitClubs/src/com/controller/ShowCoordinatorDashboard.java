package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CoursesDao;
import com.dao.ConnectionDao;
import com.dao.LoginDao;

@WebServlet("/showcoordinatordashboard")
public class ShowCoordinatorDashboard extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try
		{
			CoursesDao d1= new CoursesDao();
			
			ConnectionDao.logActivity("ShowCoordinatorDashboard: ");
			RequestDispatcher rd= req.getRequestDispatcher("viewCoordinatorSchedule.jsp");
			req.setAttribute("action", "Returned to Dashboard ");
			req.setAttribute("courseData", d1.readSchedule());
			rd.forward(req, res);

		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowAdminDashboardController Exception: "+e);
		}
	}
	
}