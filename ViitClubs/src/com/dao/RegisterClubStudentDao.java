package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.ClubEntity;
import com.entity.FeedbackEntity;
import com.entity.StudentClubEntity;

public class RegisterClubStudentDao 
{
	public boolean insertStudentClubRegistration(int studentId, int clubId) {
	    // SQL query to check if the student ID already exists
	    String checkSql = "SELECT COUNT(*) FROM club_students WHERE student_id = ? and club_id=?";
	    
	    // SQL statement to insert student club registration details if the student ID does not exist
	    String insertSql = "INSERT INTO club_students (student_id, club_id) VALUES (?, ?)";
	    
	    try (Connection con = ConnectionDao.getConnectionClubs();
	         PreparedStatement checkPt = con.prepareStatement(checkSql);
	         PreparedStatement insertPt = con.prepareStatement(insertSql)) {

	        // First, check if the student ID already exists
	        checkPt.setInt(1, studentId);
	        checkPt.setInt(2, clubId);
	        ResultSet rs = checkPt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            // If the student ID already exists, log and return false
	            ConnectionDao.logActivity("StudentClubRegistration insertStudentClubRegistration(): Failed - Student ID " + studentId + " already exists.");
	            return false;
	        }

	        // If the student ID does not exist, proceed with the insertion
	        ConnectionDao.logActivity("StudentClubRegistration insertStudentClubRegistration(): Attempting to insert StudentId=" + studentId + ", ClubId=" + clubId);
	        insertPt.setInt(1, studentId);
	        insertPt.setInt(2, clubId);

	        int i = insertPt.executeUpdate();
	        if (i == 1) {
	            ConnectionDao.logActivity("StudentClubRegistration insertStudentClubRegistration(): Success");
	            return true;
	        } else {
	            ConnectionDao.logActivity("StudentClubRegistration insertStudentClubRegistration(): Failed to insert details");
	            return false;
	        }
	    } catch (SQLException e) {
	        ConnectionDao.logActivity("StudentClubRegistration insertStudentClubRegistration() SQL Exception: " + e);
	        return false;
	    } catch (Exception e) {
	        ConnectionDao.logActivity("StudentClubRegistration insertStudentClubRegistration() Exception: " + e);
	        return false;
	    }
	}

	public ArrayList<ClubEntity> getClubsForStudent(int studentId)
	{
		try
		{
			ConnectionDao.logActivity("RegisterClubStudentDao getClubsForStudent(id): ");
			Connection con= ConnectionDao.getConnectionClubs();
			String sql = "SELECT c.id,c.name, c.acronym FROM club c INNER JOIN club_students cs ON c.id = cs.club_id WHERE cs.student_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql) ;
			stmt.setInt(1, studentId);
			ResultSet rs= stmt.executeQuery();
			
			ArrayList<ClubEntity> clubs= new ArrayList<ClubEntity>();
			ClubEntity temp;
			while(rs.next())
			{
				temp= new ClubEntity();
				temp.setClubid(rs.getInt(1));
				temp.setClubname(rs.getString(2));
				temp.setClubacronym(rs.getString(3));
				clubs.add(temp); 
				ConnectionDao.logActivity(""+temp);
			}
			con.close();
			return clubs; 
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ClubDao getClubsForStudent() Exception: "+e);
			return null;
		}
	}
	
	public String deleteClub(int clubid, int studentid)
	{
		String strError="";
		try
		{
			ConnectionDao.logActivity("RegisterClubStudentDao deletestudentClub(): "+studentid);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("delete from club_students where club_id=? and student_id=?");
			pt.setInt(1, clubid);
			pt.setInt(2, studentid);
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("RegisterClubStudentDao deletestudentClub(): "+i);
			return strError;
		}
		catch(Exception e)
		{
			strError=""+e;
			ConnectionDao.logActivity("ClubDao deleteClub() Exception: "+e);
			return strError;
		}
	}
	
	public ArrayList<StudentClubEntity> readAllEnrollment()
	{
		try
		{
			ConnectionDao.logActivity("readAllEnrollment");
			Connection con= ConnectionDao.getConnectionClubs();
			Statement st= con.createStatement();
			ResultSet rs= st.executeQuery("select cs.id, c.name, s.first_name, s.contact from club_students cs join club c on cs.club_id=c.id join students s on cs.student_id=s.student_id");
			
			ArrayList<StudentClubEntity> club= new ArrayList<StudentClubEntity>();
			StudentClubEntity sc;
			while(rs.next())
			{
				sc= new StudentClubEntity();
				sc.setClubId(rs.getInt(1));
				sc.setclubName(rs.getString(2));
				sc.setstudentName(rs.getString(3));
				sc.setcontactNum(rs.getString(4));
				club.add(sc); 
				ConnectionDao.logActivity(""+sc);
			}
			con.close();
			return club; 
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("CustomerFeedbackDao readAllCustomerFeedbacks() Exception: "+e);
			return null;
		}
	}
}
