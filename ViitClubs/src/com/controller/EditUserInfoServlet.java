package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ConnectionDao;
import com.entity.StudentEntity;

@WebServlet("/EditUserInfoServlet")
public class EditUserInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	StudentEntity user = new StudentEntity();
    String username = request.getParameter("username");
    String address = request.getParameter("address");
    String newValue = request.getParameter("newValue");
    String field = request.getParameter("field");

    Connection conn = null;
    PreparedStatement statement = null;

    try {
        conn = ConnectionDao.getConnectionClubs();
        if (conn != null) {
            conn.setAutoCommit(false); 
            System.out.println(address+ "  " + username);
            String sql = "UPDATE students SET address=? WHERE student_id=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, newValue);
            statement.setString(2, username);
            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated > 0) {
                conn.commit(); 
                response.sendRedirect("StudentInfoServlet?username=100");
            } else {
                conn.rollback(); 
                System.out.println("No rows were updated.");
            }
        } else {
            System.out.println("Failed to get connection.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        if (conn != null) {
            try {
                conn.rollback(); 
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    } finally {
        try {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.setAutoCommit(true); // Reset auto-commit to true
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
}
