package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ClubDao;
import com.dao.RegisterClubStudentDao;
import com.dao.ConnectionDao;

@WebServlet("/unregisterclub")
public class UnregisterClubStudent extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{
			RegisterClubStudentDao d1= new RegisterClubStudentDao();
			
			int clubid=Integer.parseInt(req.getParameter("id"));
			int studentid=Integer.parseInt(req.getParameter("studentId"));
			
			ConnectionDao.logActivity("UnregisterClubStudent: "+studentid +" "+ clubid);
			String strerror= d1.deleteClub(clubid,studentid);
			ConnectionDao.logActivity("DeleteClubController: "+strerror);
			
			RequestDispatcher rd= req.getRequestDispatcher("/showclubActivities");
//			req.setAttribute("clubsData", d1.readAllClubsDetails());
			if(strerror.equals(""))
			{
				req.setAttribute("action", "Club deleted successfully");
				req.setAttribute("student_id", studentid);
			}
			else
			{
				req.setAttribute("action", "Unable to delete Club. Please try again.");
			}
			rd.forward(req, res);
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("DeleteClubController Exception: "+e);
		}
	}
}
