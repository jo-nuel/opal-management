package uts.isd.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uts.isd.model.User;

// UserEditServlet obtains the user's details and allows for editing from the session-stored user list
public class UserEditServlet extends HttpServlet {

    private static ArrayList<User> users = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Initialize some users if needed
        users.add(new User("hello", "hello@gmail.com", "hello1234", "12345", "Active", "customer"));
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

        // Retrieve the email and password to find the user
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Find the user in the ArrayList based on email and password
        User user = findUser(email, password);

        if (user != null) {
            // User found, allow editing and update session
            session.setAttribute("user", user);
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
            
            // Optionally, store the access log in the session for simplicity
            String accessLog = "User " + email + " performed " + action + " on " + dateString + " at " + timeString;
            session.setAttribute("accessLog", accessLog);
        } else {
            // User not found, set an error and return to the edit page
            session.setAttribute("existErr", "User does not exist in the system!");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        }

        validator.clear(session);
    }

    // Helper method to find a user by email and password in the ArrayList
    private User findUser(String email, String password) {
        for (User user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}
