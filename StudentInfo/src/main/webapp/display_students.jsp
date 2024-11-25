<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students Information</title>
    <style>
        /* General table styling */
        table {
            width: 60%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            background-color: #f2f2f2;
        }

        /* Centering table using CSS */
        .center-table {
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
        }
        .center-table th, .center-table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h2 align="center">Students Information</h2>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "root");
            stmt = conn.createStatement();
            String sql = "SELECT * FROM students_info";
            rs = stmt.executeQuery(sql);
    %>
    <table class="center-table">
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Class</th>
            <th>Division</th>
            <th>City</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("stud_id") %></td>
            <td><%= rs.getString("stud_name") %></td>
            <td><%= rs.getString("class") %></td>
            <td><%= rs.getString("division") %></td>
            <td><%= rs.getString("city") %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
