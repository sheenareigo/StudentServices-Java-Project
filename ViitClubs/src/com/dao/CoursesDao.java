package com.dao;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.pdfbox.pdmodel.PDDocument;

import com.entity.ClubEntity;
import com.entity.CourseEntity;


public class CoursesDao 
{

	public boolean insertCourseFile(String course_id, InputStream istream)
	{
		String message = null;
		try
		{
			  // message will be sent back to client
			CourseEntity course=new CourseEntity();
			ConnectionDao.logActivity("CoursesDao insertCourseFile(): "+course_id);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("insert into CourseSchedules(course_id,schedule_file) values(?,?)");
			pt.setString(1, course_id);
			//id column is auto-increment
			pt.setBinaryStream(2, istream);
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("CoursesDao insertCourseFile(): "+i);
			if(i==1)
			{	
				con.close();
			    message = "File uploaded and saved into database";
				return true;   
			}
			else
			{	
				con.close();
				return false;  
			}
		}
		catch(Exception e)
		{    message = "ERROR: " + e.getMessage();
			ConnectionDao.logActivity("insertCourseFile() Exception: "+e);
			return false;
		}
	}
	
	
	public ArrayList<CourseEntity> readSchedule() {
        try {
            ConnectionDao.logActivity("ClubDao readSchedule");
            Connection con = ConnectionDao.getConnectionClubs();
            PreparedStatement pt = con.prepareStatement("select * from CourseSchedules");
            ResultSet rs = pt.executeQuery();

            ArrayList<CourseEntity> course = new ArrayList<CourseEntity>();
            CourseEntity temp;
            while (rs.next()) {
                temp = new CourseEntity();
                temp.setcourse_id(rs.getString(1));
                temp.setCourseName(rs.getString(1));
                course.add(temp);
                
                // Step 1: Write BLOB data to a temporary file
            //    String tempFileName = "temp.pdf";
//                File tempFile = File.createTempFile("temp", ".pdf");
//                try (FileOutputStream fos = new FileOutputStream(tempFile)) {
//                    fos.write(rs.getBytes(2));
//                }
//
//                // Step 2: Read the temporary file and convert it to PDF
//                PDDocument document = PDDocument.load(tempFile);
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                document.save(baos);
//                document.close();
//                byte[] pdfData = baos.toByteArray();
//
//                // Step 3: Set the PDF data to the CourseEntity
//                temp.setScheduleFile(pdfData);
//                course.add(temp);
//
//                // Clean up: Delete the temporary file
//           //     File tempFile = new File(tempFileName);
//                tempFile.delete();

                System.out.println("inside course DAO");
                System.out.println(rs.getString(1));
                ConnectionDao.logActivity("" + temp);
            }
            con.close();
            return course;
        } catch (Exception e) {
            ConnectionDao.logActivity("CourseDao readSchedule() Exception: " + e);
            return null;
        }

    }

	public ArrayList<CourseEntity> readStudentSchedule(int student_id) {
        try {
            ConnectionDao.logActivity("ClubDao readSchedule");
            Connection con = ConnectionDao.getConnectionClubs();
            
            PreparedStatement pt = con.prepareStatement("select c.course_id, c.schedule_file from CourseSchedules c join student_course sc on c.course_id= sc.course_id join students s on sc.student_id=s.student_id where s.student_id=?");
            pt.setInt(1,student_id);
            ResultSet rs = pt.executeQuery();

            ArrayList<CourseEntity> course = new ArrayList<CourseEntity>();
            CourseEntity temp;
            while (rs.next()) {
                temp = new CourseEntity();
                temp.setcourse_id(rs.getString(1));
                temp.setCourseName("CourseSchedule");
                course.add(temp);
                
                // Step 1: Write BLOB data to a temporary file
            //    String tempFileName = "temp.pdf";
//                File tempFile = File.createTempFile("temp", ".pdf");
//                try (FileOutputStream fos = new FileOutputStream(tempFile)) {
//                    fos.write(rs.getBytes(2));
//                }
//
//                // Step 2: Read the temporary file and convert it to PDF
//                PDDocument document = PDDocument.load(tempFile);
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                document.save(baos);
//                document.close();
//                byte[] pdfData = baos.toByteArray();
//
//                // Step 3: Set the PDF data to the CourseEntity
//                temp.setScheduleFile(pdfData);
//                course.add(temp);
//
//                // Clean up: Delete the temporary file
//           //     File tempFile = new File(tempFileName);
//                tempFile.delete();

                System.out.println("inside course DAO");
                System.out.println(rs.getString(1));
                ConnectionDao.logActivity("" + temp);
            }
            con.close();
            return course;
        } catch (Exception e) {
            ConnectionDao.logActivity("CourseDao readSchedule() Exception: " + e);
            return null;
        }

    }
	
	
	public String deleteCourse(String id)
	{
		String strError="";
		try
		{
			ConnectionDao.logActivity("CourseDao deleteCourse(): "+id);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("delete from CourseSchedules where course_id=?");
			pt.setString(1, id);
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("CourseDao deleteCourse(): "+i);
			return strError;
		}
		catch(Exception e)
		{
			strError=""+e;
			ConnectionDao.logActivity("CourseDao deleteCourse() Exception: "+e);
			return strError;
		}
	}
	
}
