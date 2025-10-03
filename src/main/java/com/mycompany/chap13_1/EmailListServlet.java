package com.mycompany.chap13_1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/emailList")
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET request - show the form
        System.out.println("GET request to /emailList - showing join form");
        getServletContext()
                .getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        // Logging cho debug
        System.out.println("=== EmailListServlet POST Request ===");
        System.out.println("Context Path: " + request.getContextPath());
        System.out.println("Request URI: " + request.getRequestURI());
        
        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }
        System.out.println("Action: " + action);

        String url = "/index.jsp";
        
        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/index.jsp";    // the "join" page
        } 
        else if (action.equals("add")) {
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            
            System.out.println("Processing user: " + firstName + " " + lastName + " (" + email + ")");

            // No database - just pass data to thank you page
            url = "/thanks.jsp";
            
            // Set attributes to display in thanks.jsp
            request.setAttribute("email", email);
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            
            System.out.println("Forwarding to thanks.jsp");
        }
        
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }    
}