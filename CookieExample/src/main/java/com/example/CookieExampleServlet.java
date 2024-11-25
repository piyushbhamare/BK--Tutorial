package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/CookieExampleServlet")
public class CookieExampleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        response.setContentType("text/html");
		        PrintWriter out = response.getWriter();
		        // Read cookies
		        Cookie[] cookies = request.getCookies();
		        boolean found = false;
		        if (cookies != null) {
		            for (Cookie cookie : cookies) {
		                if (cookie.getName().equals("username")) {
		                    out.println("Welcome back, " + cookie.getValue());
		                    found = true;
		                    break;
		                }
		            }
		        }
		        if (!found) {
		            // Set a new cookie
		            String username = request.getParameter("username");
		            if (username != null && !username.equals("")) {
		                Cookie userCookie = new Cookie("username", username);
		                userCookie.setMaxAge(10); // Cookie expires in 1 hour
		                response.addCookie(userCookie);
		                out.println("Hello, " + username + "! Your name is saved in a cookie.");
		            } else {
		                out.println("Please provide your name in the URL, e.g., ?username=John");
		            }
		        }
		    }
}
