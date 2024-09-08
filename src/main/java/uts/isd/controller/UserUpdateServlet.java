package uts.isd.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uts.isd.model.User;

// UserUpdateServlet is used to update user details based on new inputs from the edit page.
public class UserUpdateServlet extends HttpServlet {

    // In-memory list of users (simulates a database)
    private static ArrayList<User> users = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Initialize with some users for testing purposes
        users.add(new User("hello", "hello@gmail.com", "hello1234", "12345", "Active", "customer"));
        users.add(new User("john", "john.doe@example.com", "password456", "67890", "Inactive", "admin"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserValidator validator = new UserValidator();
        
        // Access log creation
        LocalTime time = LocalTime.now();
        DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("HH:mm:ss");
        String timeString = time.format(formatterTime);

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateString = currentDate.format(formatterDate);

        String action = "Edited Details";

        // New details are passed in from userEdit.jsp
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String ID = request.getParameter("ID");
        String status = "Active";  // Assuming the user remains active
        String role = request.getParameter("role");

        // Create a new user object with the updated details
        User updatedUser = new User(name, email, password, ID, status, role);

        // Validator reset to prevent old errors
        validator.clear(session);

        // Validation logic for name and password formatting
        if (validator.checkEmptyUpdate(password, name)) {
            session.setAttribute("emptyError", "Please enter all fields");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if (!validator.passwordFormat(password)) {
            session.setAttribute("passwordError", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else if (!validator.nameFormat(name)) {
            session.setAttribute("nameError", "Your name must not include numbers");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } else {
            try {
                // Find the user in the list by ID and update their details
                User existingUser = findUserByID(ID);
                if (existingUser != null) {
                    // Update user details in the list
                    existingUser.setName(name);
                    existingUser.setEmail(email);
                    existingUser.setPassword(password);
                    existingUser.setRole(role);
                    existingUser.setStatus(status); // Assuming the status remains unchanged

                    // Update the session and access log
                    session.setAttribute("user", existingUser);
                    String accessLog = "User " + email + " performed " + action + " on " + dateString + " at " + timeString;
                    session.setAttribute("accessLog", accessLog);

                    // Redirect to the main page
                    request.getRequestDispatcher("main.jsp").include(request, response);
                } else {
                    // User not found, show error
                    session.setAttribute("existErr", "Update was not successful. User not found.");
                    request.getRequestDispatcher("userEdit.jsp").include(request, response);
                }
            } catch (Exception ex) {
                Logger.getLogger(UserUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            validator.clear(session);
        }
    }

    // Helper method to find a user by ID in the ArrayList
    private User findUserByID(String ID) {
        for (User user : users) {
            if (user.getID().equals(ID)) {
                return user;
            }
        }
        return null;
    }
}
