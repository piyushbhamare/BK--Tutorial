package com.example;

import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class RegisterStudentServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("RegisterStudent.html"); 
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        int rollno = Integer.parseInt(request.getParameter("rollno"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        int maths = Integer.parseInt(request.getParameter("maths"));
        int science = Integer.parseInt(request.getParameter("science"));
        int english = Integer.parseInt(request.getParameter("english"));
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "root");
            
            String query = "INSERT INTO Students (rollno, name, age, gender, maths, science, english) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, rollno);
            ps.setString(2, name);
            ps.setInt(3, age);
            ps.setString(4, gender);
            ps.setInt(5, maths);
            ps.setInt(6, science);
            ps.setInt(7, english);
            int i = ps.executeUpdate();
            
            if (i > 0) {
                out.println("<h3>Student registered successfully!</h3>");
            } else {
                out.println("<h3>Registration failed. Please try again.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
        }
    }
}
