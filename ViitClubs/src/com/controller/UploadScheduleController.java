package com.controller;

import java.io.ByteArrayOutputStream;
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
import com.dao.CoursesDao;
import com.dao.LoginDao;
import com.entity.CourseEntity;

//1.5MB filesize
@WebServlet("/uploadschedule")
@MultipartConfig(maxFileSize = 16177216)
public class UploadScheduleController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{			
			ConnectionDao.logActivity("UploadScheduleController:  tags: "+req.getParameter("tags-1"));
			
			CoursesDao d1= new CoursesDao();
			CourseEntity course= new CourseEntity();
			FileInputStream istream;
			
			Part filepart = req.getPart("file");
			if(filepart.getSize()!=0)
			{
				ConnectionDao.logActivity("UploadScheduleController:  filepart: "+filepart.getName()+", "+filepart.getSize()+", "+filepart.getContentType());
				istream= (FileInputStream)filepart.getInputStream();
			}
			else
			{
				istream= (FileInputStream)filepart.getInputStream();
				ConnectionDao.logActivity("UploadScheduleController: "+ "file not uploaded");
			}
			
			String course_id=(req.getParameter("course_id"));
			ConnectionDao.logActivity("Course_id: "+ course_id);
//			String course_name=(req.getParameter("course_name"));
			 
			
			ConnectionDao.logActivity("UploadScheduleController: " + "insert coursefile");
			
			boolean b= d1.insertCourseFile(course_id,istream);
			ConnectionDao.logActivity("UploadScheduleController: "+b);
			
			RequestDispatcher rd= req.getRequestDispatcher("coordinatordashboard");
			
//			req.setAttribute("clubsData", d1.readAllClubsDetails());
			
			if(b)
			{
				req.setAttribute("action", "Schedule uploaded successfully");
				rd.forward(req, res);
			}
			else
			{
				req.setAttribute("action", "Unable to upload schedule. Please try again.");
				rd.forward(req, res);
			}
		
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("UploadScheduleController Exception: "+e);
		}
	}

	

}
