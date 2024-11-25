package com.example;

public class Product {
	 private int id;
	 private String name;
	 private double price;
	 private int quantity;
	 private double totalSales;
	
	 // Getters and Setters
	 public int getId() {
	     return id;
	 }
	 public void setId(int id) {
	     this.id = id;
	 }
	
	 public String getName() {
	     return name;
	 }
	 public void setName(String name) {
	     this.name = name;
	 }
	
	 public double getPrice() {
	     return price;
	 }
	 public void setPrice(double price) {
	     this.price = price;
	 }
	
	 public int getQuantity() {
	     return quantity;
	 }
	 public void setQuantity(int quantity) {
	     this.quantity = quantity;
	 }
	
	 public double getTotalSales() {
	     return totalSales;
	 }
	 public void setTotalSales(double totalSales) {
	     this.totalSales = totalSales;
	 }
}
