package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ClubDao;
import com.dao.ConnectionDao;
import com.dao.RegisterClubStudentDao;

@WebServlet("/showclubActivities")
public class ShowStudentClubActivities extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try
		{
			HttpSession session = req.getSession();

	        // Retrieve a session attribute
			int studentId = (Integer) session.getAttribute("student_id");
	        // Use the session attribute
			//int studentId = 102; 
			RegisterClubStudentDao d1= new RegisterClubStudentDao();
			
			ConnectionDao.logActivity("ShowStudentClubActivities: ");
			RequestDispatcher rd= req.getRequestDispatcher("/clubActivities.jsp");
			req.setAttribute("clubsData", d1.getClubsForStudent(studentId));
			req.setAttribute("student_id", studentId);
			rd.forward(req, res);

		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowStudentClubActivities Exception: "+e);
		}
	}
}
