package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CoursesDao;
import com.dao.ConnectionDao;

@WebServlet("/deleteSchedule")
public class DeleteScheduleController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{
			CoursesDao d1= new CoursesDao();
			
			String id=(req.getParameter("courseId"));
			ConnectionDao.logActivity("DeleteScheduleController: "+id);
			String strerror= d1.deleteCourse(id);
			ConnectionDao.logActivity("DeleteScheduleController: "+strerror);
			
			 RequestDispatcher rd= req.getRequestDispatcher("showcoordinatordashboard");
			 req.setAttribute("action", "Schedule deleted successfully");
        
			
			if(strerror.equals(""))
			{
				req.setAttribute("action", "Club deleted successfully");
			}
			else
			{
				req.setAttribute("action", "Unable to delete Club. Please try again.");
			}
			rd.forward(req, res);
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("DeleteScheduleController Exception: "+e);
		}
	}
}
