<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.Product, java.util.ArrayList" %>
<%
    ArrayList<Product> inventory = (ArrayList<Product>) session.getAttribute("inventory");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Product</title>
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
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td input[type="number"] {
            width: 80px;
            padding: 6px;
            font-size: 14px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Make a Purchase</h2>
        <% if (inventory == null || inventory.isEmpty()) { %>
            <p>No products available in inventory!</p>
            <a href="addProduct.jsp">Add Products</a>
        <% } else { %>
            <form action="processPurchase.jsp" method="post">
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Available Quantity</th>
                        <th>Quantity to Buy</th>
                    </tr>
                    <% for (Product product : inventory) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getPrice() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td><input type="number" name="quantity_<%= product.getId() %>" value="0" min="0"></td>
                    </tr>
                    <% } %>
                </table>
                <input type="submit" value="Purchase">
            </form>
        <% } %>
    </div>
</body>
</html>
