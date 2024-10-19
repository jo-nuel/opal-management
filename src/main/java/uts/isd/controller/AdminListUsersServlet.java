package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.dao.DBManager;
import uts.isd.model.User;

public class AdminListUsersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        // Get filter parameters from the request
        String filterId = request.getParameter("filterId");
        String filterEmail = request.getParameter("filterEmail");
        String filterRole = request.getParameter("filterRole");
        String filterStatus = request.getParameter("filterStatus");

        try {
            ArrayList<User> users;

            // Check if any filters were applied
            if ((filterId != null && !filterId.isEmpty()) || 
                (filterEmail != null && !filterEmail.isEmpty()) || 
                (filterRole != null && !filterRole.isEmpty()) || 
                (filterStatus != null && !filterStatus.isEmpty())) {
                
                // Fetch filtered users based on parameters
                users = manager.fetchFilteredUsers(filterId, filterEmail, filterRole, filterStatus);
            } else {
                // No filters, fetch all users
                users = manager.fetchUsers();
                request.setAttribute("errorMessage", "No events found matching the filter criteria.");

            }
            

            // Store the filtered (or all) users in session
            session.setAttribute("userList", users);
            response.sendRedirect("adminListUsers.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
