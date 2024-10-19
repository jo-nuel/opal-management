package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.dao.DBManager;
import uts.isd.model.User;

public class UserUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");  // Get DBManager from session
        UserValidator validator = new UserValidator();


         // Check if the "cancel" button was clicked
         String cancelAction = request.getParameter("cancel");

         // If cancel button was clicked, clear the validator and redirect
         if (cancelAction != null) {
            validator.clear(session);  // Clear validation errors
            session.removeAttribute("emptyError");
            session.removeAttribute("oldPasswordError");
            session.removeAttribute("passwordError");
            session.removeAttribute("nameError");
            response.sendRedirect("main.jsp");  // Redirect to the main page
            return;
        }

        // Retrieve the currently logged-in user from the session
        User loggedInUser = (User) session.getAttribute("user");

        // Access log creation
        LocalTime time = LocalTime.now();
        DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("HH:mm:ss");
        String timeString = time.format(formatterTime);

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateString = currentDate.format(formatterDate);

        String action = "Edited Details";

        // Get user input from the form
        String name = request.getParameter("name");
        String oldPassword = request.getParameter("oldPassword");  // Old password entered by the user
        String newPassword = request.getParameter("password");     // New password entered by the user

        //these arent changed so will be retrieved from user
        String email = loggedInUser.getEmail();
        // Reset validator
        validator.clear(session);

        // Validation logic
        if (validator.checkEmptyUpdate(newPassword, name, oldPassword)) {
            session.setAttribute("emptyError", "Please enter all fields");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } 
        else if (!validator.passwordFormat(newPassword)) {
            session.setAttribute("passwordError", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } 
        else if (!validator.nameFormat(name)) {
            session.setAttribute("nameError", "Your name must not include numbers");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } 
        else if (!loggedInUser.getPassword().equals(oldPassword)) {
            // Validate old password
            session.setAttribute("oldPasswordError", "Old password is incorrect");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        } 
        else {
            try {
                // Update user details in the database using DBManager
                manager.updateUser(name, email, newPassword);  // Update name and password in DB
                loggedInUser.setName(name);
                loggedInUser.setPassword(newPassword);

                // Update the session with the new user information
                session.setAttribute("user", loggedInUser);

                // Create access log entry
                // manager.addAccessLog(email, action, dateString, timeString);
                validator.clear(session);
                // Redirect to the main page
                request.getRequestDispatcher("main.jsp").include(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(UserUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("dbError", "Database error occurred while updating user details.");
                request.getRequestDispatcher("userEdit.jsp").include(request, response);
            }
        }
    }
}
