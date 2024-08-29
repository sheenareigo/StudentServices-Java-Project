package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.ConnectionDao;
import com.dao.StudentLoginDao;
import com.entity.StudentEntity;

@WebServlet("/studentlogin")
public class StudentLoginController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try
		{
			StudentLoginDao d1= new StudentLoginDao();
			System.out.println("hi");
			String student_id=req.getParameter("student_id");
			String password=req.getParameter("password");
			ConnectionDao.logActivity("StudentLoginController: "+student_id+", "+password);
			
			StudentEntity b= d1.verify(student_id,password);
			ConnectionDao.logActivity("StudentLoginController: "+b);
			
			if(b!=null)
			{
				HttpSession session= req.getSession();
				session.setAttribute("student_id",b.getStudentid());
				System.out.print("b.getStudentid() : "+b.getStudentid() );
//				<a href="clubregister.jsp?clubId=<%=club.getStudentid()%>
				RequestDispatcher rd= req.getRequestDispatcher("studenthomePage");
				System.out.println("hi2");
				req.setAttribute("action", "Logged in successfully. ");
				req.setAttribute("student_name", b.getFirst_name());
				rd.forward(req, res);
			}
			else
			{
				RequestDispatcher rd= req.getRequestDispatcher("studentlogin.jsp");
				req.setAttribute("action", "Error");
				rd.forward(req, res);
			}
		}
		catch(Exception e)
		{
			
			ConnectionDao.logActivity("StudentLoginController Exception: "+e);
		}
	}
}
