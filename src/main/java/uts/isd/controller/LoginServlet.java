package uts.isd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uts.isd.model.User;

public class LoginServlet extends HttpServlet {

    private static ArrayList<User> users = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Initialize with some users (you can add more if needed)
        users.add(new User("hello", "hello@gmail.com", "hello1234", "12345", "Active", "customer"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate login credentials against the array of users
        User user = findUser(email, password);

        if (user != null && "Active".equals(user.getStatus())) {
            // User found and active
            session.setAttribute("user", user);
            response.sendRedirect("main.jsp"); // Redirect to main page
        } else if (user != null && !"Active".equals(user.getStatus())) {
            // User found but inactive
            session.setAttribute("badLoginError", "Account is inactive");
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else {
            // Invalid email/password combination
            session.setAttribute("badLoginError", "Invalid email/password combination");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
    }

    // Helper method to find a user by email and password in the ArrayList
    private User findUser(String email, String password) {
        for (User user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null; // User not found
    }
}