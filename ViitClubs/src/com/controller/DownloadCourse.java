package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.ConnectionDao;


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
@WebServlet("/downloadCourse")
public class DownloadCourse extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
    	  Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          String role=req.getParameter("role");
          System.out.println(role);
          String courseId = req.getParameter("courseId");
          String selectQuery = "SELECT schedule_file FROM CourseSchedules WHERE course_id = ?";
          String outputFileName = "C:/Users/sheen/Downloads/"+courseId+".pdf";
          Integer student_id=0;
          if(req.getParameter("username")!=null) {
          student_id=Integer.parseInt(req.getParameter("username"));
          }

    	conn = ConnectionDao.getConnectionClubs();
		System.out.println("Database connection successful!\n");
            

            // Download PDF from database
            try (PreparedStatement selectStatement = conn.prepareStatement(selectQuery)) {
                selectStatement.setString(1, courseId);
                ResultSet resultSet = selectStatement.executeQuery();
                if (resultSet.next()) {

                    InputStream inputStream = resultSet.getBinaryStream("schedule_file");
                    FileOutputStream outputStream = new FileOutputStream(outputFileName);

                    byte[] buffer = new byte[1024];
                    while (inputStream.read(buffer) > 0) {
                        outputStream.write(buffer);
                    }

                    inputStream.close();
                    outputStream.close();
                    System.out.println("PDF downloaded from database and saved to " + outputFileName);
                    
                    if("coordinator".equals(role)) {
                    
                    RequestDispatcher rd= req.getRequestDispatcher("showcoordinatordashboard");
                   
                    rd.forward(req, res);
                    }
                    else if("student".equals(role))
                    {
                    	System.out.println(role);
                    	 RequestDispatcher rd= req.getRequestDispatcher("showstudentschedule");
                    	 req.setAttribute("username", student_id);
                    	 rd.forward(req, res);
                    	
                    }
                   
                } else {
                    System.out.println("PDF not found for course ID " + courseId);
                }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}