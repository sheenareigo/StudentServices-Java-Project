package com.entity;


public class StudentClubEntity {
    

    public int id;

    public int clubId;

    public int studentId;
    
    public String studentName;
    public String contactNum;
    public String clubName;
    

    public StudentClubEntity() {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    
    public String getcontactNum() {
        return contactNum;
    }
    public void setcontactNum(String contactNum) {
        this.contactNum = contactNum;
    }
    
    public String getstudentName() {
        return studentName;
    }
    public void setstudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getclubName() {
        return clubName;
    }
    public void setclubName(String clubName) {
        this.clubName = clubName;
    }

    // toString method
    @Override
    public String toString() {
        return "ClubStudent{" +
               "id=" + id +
               ", clubId=" + clubId +
               ", studentId=" + studentId +
               '}';
    }
}
