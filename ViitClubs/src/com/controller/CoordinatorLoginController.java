package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ClubDao;
import com.dao.ConnectionDao;
import com.dao.LoginDao;
import com.dao.CoordinatorLoginDao;

@WebServlet("/coordinatorlogin")
public class CoordinatorLoginController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try
		{
			CoordinatorLoginDao d1= new CoordinatorLoginDao();
			
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			ConnectionDao.logActivity("CoordinatorLoginDao: "+username+", "+password);
			
			boolean b= d1.verify(username,password);
			ConnectionDao.logActivity("LoginController: "+b);
			
			if(b)
			{
				HttpSession session= req.getSession();
				session.setAttribute("username",username);
				RequestDispatcher rd= req.getRequestDispatcher("coordinatorDashboard.jsp");
				req.setAttribute("action", "Logged in successfully. ");
//				req.setAttribute("clubsData", d2.readAllClubsDetails());
				rd.forward(req, res);
			}
			else
			{
				RequestDispatcher rd= req.getRequestDispatcher("coordinatorLogin.jsp");
				req.setAttribute("action", "Unable to Login. Please try again. ");
				rd.forward(req, res);
			}
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("LoginController Exception: "+e);
		}
	}
}
