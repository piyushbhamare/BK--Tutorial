package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booklist")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String jdbcURL = "jdbc:mysql://localhost:3306/java";
        String dbUser = "root";
        String dbPassword = "root";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish a database connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            // Create SQL query
            String sql = "SELECT * FROM ebookshop";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            // Display HTML
            out.println("<html><body>");
            out.println("<h2>Book List</h2>");
            out.println("<table border='1'><tr><th>ID</th><th>Title</th><th>Author</th><th>Price</th><th>Quantity</th></tr>");
            // Process result set
            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                String title = resultSet.getString("book_title");
                String author = resultSet.getString("book_author");
                double price = resultSet.getDouble("book_price");
                int quantity = resultSet.getInt("quantity");  
                out.println("<tr><td>" + id + "</td><td>" + title + "</td><td>" + author + "</td><td>" + price + "</td><td>" + quantity + "</td></tr>");
            }
            out.println("</table>");
            out.println("</body></html>");
            // Close connections
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}
