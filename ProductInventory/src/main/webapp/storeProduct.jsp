<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.Product, java.util.ArrayList" %>

<%
    // Ensure the inventory list is initialized for this session
    @SuppressWarnings("unchecked")
    ArrayList<Product> inventory = (ArrayList<Product>) session.getAttribute("inventory");

    // Reset the inventory if this is the first run of the session
    if (inventory == null) {
        inventory = new ArrayList<>();
        session.setAttribute("inventory", inventory); // Save the new empty list in the session
    }

    // Create a new Product object from the form inputs
    Product product = new Product();
    product.setId(Integer.parseInt(request.getParameter("id")));
    product.setName(request.getParameter("name"));
    product.setPrice(Double.parseDouble(request.getParameter("price")));
    product.setQuantity(Integer.parseInt(request.getParameter("quantity")));

    // Add the product to the session inventory
    inventory.add(product);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Product Registration Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        p {
            font-size: 18px;
            color: #333;
            text-align: center;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a {
            font-size: 16px;
            color: #4CAF50;
            text-decoration: none;
            margin: 0 15px;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Product Registered Successfully</h2>
        <p>Product <strong><%= product.getName() %></strong> registered successfully!</p>
        <div class="links">
            <a href="addProduct.jsp">Register Another Product</a> | 
            <a href="purchaseProduct.jsp">Make a Purchase</a>
        </div>
    </div>
</body>
</html>
