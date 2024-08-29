package com.entity;

public class CourseEntity {
    private String course_id;
    private String courseName;
    private byte[] scheduleFile; // This will hold the binary data for the file

    // Default constructor
    public CourseEntity() {
    }

    // Constructor with parameters
    public CourseEntity(String course_id, String courseName, byte[] scheduleFile) {
        this.course_id = course_id;
        this.courseName = courseName;
        this.scheduleFile = scheduleFile;
    }

    // Getters and setters
    public String getcourse_id() {
        return course_id;
    }

    public void setcourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public byte[] getScheduleFile() {
        return scheduleFile;
    }

    public void setScheduleFile(byte[] scheduleFile) {
        this.scheduleFile = scheduleFile;
    }
}
