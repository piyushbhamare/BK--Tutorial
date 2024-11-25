<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Product, java.util.ArrayList" %>
<%
    // Retrieve the inventory list from the session
    ArrayList<Product> inventory = (ArrayList<Product>) session.getAttribute("inventory");
    double totalBill = 0;
    ArrayList<String> purchasedItems = new ArrayList<>();

    // Process each product in the inventory and update its quantity
    for (Product product : inventory) {
        String quantityParam = "quantity_" + product.getId();
        int quantityToBuy = Integer.parseInt(request.getParameter(quantityParam));

        if (quantityToBuy > 0 && quantityToBuy <= product.getQuantity()) {
            // Deduct the purchased quantity from available stock
            product.setQuantity(product.getQuantity() - quantityToBuy);
            double sale = quantityToBuy * product.getPrice();
            product.setTotalSales(product.getTotalSales() + sale);
            totalBill += sale;
            purchasedItems.add(product.getName() + " (Qty: " + quantityToBuy + ", Subtotal: ₹" + sale + ")");
        }
    }

    // Remove products with 0 quantity from the inventory list
    inventory.removeIf(product -> product.getQuantity() == 0);

    // Update the inventory list in the session after purchase
    session.setAttribute("inventory", inventory);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Summary</title>
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
        td {
            background-color: #f9f9f9;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 8px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            margin-bottom: 5px;
        }
        .total {
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a {
            font-size: 16px;
            color: #4CAF50;
            text-decoration: none;
            margin: 0 10px;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Purchase Summary</h2>
        <% if (purchasedItems.isEmpty()) { %>
            <p>No items purchased!</p>
        <% } else { %>
            <ul>
                <% for (String item : purchasedItems) { %>
                    <li><%= item %></li>
                <% } %>
            </ul>
            <h3 class="total">Total Bill: $<%= totalBill %></h3>
        <% } %>

        <h2>Updated Inventory</h2>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Remaining Quantity</th>
                <th>Total Sales</th>
            </tr>
            <% for (Product product : inventory) { %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getTotalSales() %></td>
            </tr>
            <% } %>
        </table>
        <div class="links">
            <a href="purchaseProduct.jsp">Make Another Purchase</a> | 
            <a href="addProduct.jsp">Add More Products</a>
        </div>
    </div>
</body>
</html>
