package com.example;

import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class ShowStudentReportServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "root");
            String query = "SELECT * FROM Students";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            out.println("<h2 style='text-align: center; color: #333; margin-bottom: 20px;'>Student Report</h2>");
            out.println("<table style='width: 80%; margin: 0 auto; border-collapse: collapse; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); background-color: #fff;'>");
            out.println("<tr style='background-color: #007bff; color: white;'>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Roll No</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Name</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Age</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Gender</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Maths</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Science</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>English</th>"
                        + "<th style='padding: 10px; border: 1px solid #ddd;'>Total Marks</th></tr>");

            while (rs.next()) {
                int rollno = rs.getInt("rollno");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String gender = rs.getString("gender");
                int maths = rs.getInt("maths");
                int science = rs.getInt("science");
                int english = rs.getInt("english");
                int totalMarks = maths + science + english;
                out.println("<tr><td>" + rollno + "</td><td>" + name + "</td><td>" + age + "</td><td>" + gender + "</td><td>" 
                            + maths + "</td><td>" + science + "</td><td>" + english + "</td><td>" + totalMarks + "</td></tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
        }
    }
}