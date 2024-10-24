package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uts.isd.dao.DBManager;
import uts.isd.model.User;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate login credentials against the array of users
        try {
            // Use the DBManager to check if the user exists and retrieve the user info
            User user = manager.findUser(email, password);

            if (user != null && "admin".equals(user.getRole()) && "active".equals(user.getStatus())) {
                // User found and active
                session.setAttribute("user", user);
                session.setAttribute("userID", String.valueOf(user.getID()));
                response.sendRedirect("adminMain.jsp");
            } else if (user != null && "user".equals(user.getRole()) && "active".equals(user.getStatus())) {
                session.setAttribute("user", user);
                session.setAttribute("userID", String.valueOf(user.getID()));
                System.out.println("User ID: " + session.getAttribute("userID"));
                response.sendRedirect("ListOpalCardsServlet");
            } else if (user != null && !"active".equals(user.getStatus())) {
                // User found but inactive
                session.setAttribute("badLoginError", "Account is inactive");
                request.getRequestDispatcher("login.jsp").include(request, response);
            } else {
                // Invalid email/password combination
                session.setAttribute("badLoginError", "Invalid email/password combination");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions that might occur during DB operations
            session.setAttribute("dbError", "Database error occurred while processing your request.");
            request.getRequestDispatcher("login.jsp").include(request, response);
            e.printStackTrace(); // Log the error for debugging
        }
    }
}