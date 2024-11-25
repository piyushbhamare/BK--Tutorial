<%@ page import="java.io.*" %>
<html>
<head>
    <title>Validation Page</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "password123".equals(password)) {
        response.sendRedirect("welcome.jsp?user=" + username);
    } else {
        out.println("Invalid Login! Try again.");
        out.println("<br><a href='login.jsp'>Go Back to Login Page</a>");
    }
%>
</body>
</html>
