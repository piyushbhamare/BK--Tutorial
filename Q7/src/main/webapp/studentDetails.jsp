<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Student" %>
<jsp:useBean id="student" class="com.example.Student" scope="request">
    <jsp:setProperty name="student" property="*" />
</jsp:useBean>

<%
        @SuppressWarnings("unchecked")
    	List<Student> studentList = (List<Student>) session.getAttribute("studentList");
    
   
    if (studentList == null) {
        studentList = new java.util.ArrayList<Student>();
    }
    
    studentList.add(student);
    
    session.setAttribute("studentList", studentList);
%>

<html>
<head>
    <title>Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .details-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 500px;
        }

        .details-container table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .details-container th, .details-container td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .details-container th {
            background-color: #4CAF50;
            color: white;
        }

        .details-container td {
            background-color: #f9f9f9;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="details-container">
        <h2>All Student Details</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Grade</th>
            </tr>
            <%
                for (Student stu : studentList) {
            %>
            <tr>
                <td><%= stu.getName() %></td>
                <td><%= stu.getAge() %></td>
                <td><%= stu.getGrade() %></td>
            </tr>
            <% } %>
        </table>
        <br><a href="student.jsp">Go Back</a>
    </div>
</body>
</html>
