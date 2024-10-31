package uts.isd.controller;

import uts.isd.dao.SavedTripDAO;
import uts.isd.model.SavedTrip;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ViewSavedTripsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        SavedTripDAO savedTripDAO = (SavedTripDAO) session.getAttribute("savedTripDAO");

        // Retrieve the user ID from the session
        String userID = (String) session.getAttribute("userID");
        String labelFilter = request.getParameter("labelFilter");

        if (userID == null) {
            session.setAttribute("error", "User is not logged in.");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            List<SavedTrip> savedTrips;
            if (labelFilter != null && !labelFilter.isEmpty()) {
                savedTrips = savedTripDAO.getTripsByUserIDAndLabel(userID, labelFilter);
            } else {
                savedTrips = savedTripDAO.getTripsByUserID(userID);
            }
            request.setAttribute("trips", savedTrips);
            request.getRequestDispatcher("viewSavedTrips.jsp").forward(request, response);
            System.out.println("User ID: " + userID);
            System.out.println("Label Filter: " + labelFilter);
            System.out.println("Saved Trips Retrieved: " + savedTrips.size());
            for (SavedTrip trip : savedTrips) {
                System.out.println("Trip Label: " + trip.getLabel());
            }

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: Unable to retrieve saved trips.");
            response.sendRedirect("error.jsp");
        }
    }
}
