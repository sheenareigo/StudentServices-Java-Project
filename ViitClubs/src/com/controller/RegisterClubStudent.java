package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.ConnectionDao;
import com.dao.ClubDao;
import com.dao.RegisterClubStudentDao;
import com.entity.StudentClubEntity;


@WebServlet("/registerclubStudent")
public class RegisterClubStudent extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{			
			
			RegisterClubStudentDao d2=new RegisterClubStudentDao();
			StudentClubEntity sclub= new StudentClubEntity();
			sclub.setClubId(Integer.parseInt(req.getParameter("clubId")));
			sclub.setStudentId(Integer.parseInt(req.getParameter("studentId")));

			ConnectionDao.logActivity("RegisterClubStudent: "+sclub);
			
			boolean b= d2.insertStudentClubRegistration(sclub.studentId, sclub.clubId);
			ConnectionDao.logActivity("RegisterClubStudent: "+b);
			
			
			
			if(b)
			{
				res.sendRedirect("homepage?successMessage= Registeration successful. You can now view club activities");
//				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
//				req.setAttribute("successMessage", "Student registered to the club successfully");
//				rd.forward(req, res);
			}
			else
			{
				 res.sendRedirect("homepage?errorMessage= User already registered.");
//				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
//				req.setAttribute("errorMessage", "Unable to register to the Club. Please try again.");
//				rd.forward(req, res);
			}
		
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("RegisterClubStudent Exception: "+e);
		}
	}
}
