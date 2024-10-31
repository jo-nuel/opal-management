package uts.isd.controller;

import uts.isd.dao.SavedTripDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class EditSavedTripServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        SavedTripDAO savedTripDAO = (SavedTripDAO) session.getAttribute("savedTripDAO");

        // Retrieve parameters for editing
        String savedTripID = request.getParameter("savedTripID");
        String newSavedTripName = request.getParameter("savedTripName");
        String newStartLocation = request.getParameter("startLocation");
        String newDestination = request.getParameter("destination");
        String label = request.getParameter("label"); // New label parameter

        // Validate required fields
        if (savedTripID == null || newSavedTripName == null || newStartLocation == null || newDestination == null ||
                newSavedTripName.isEmpty() || newStartLocation.isEmpty() || newDestination.isEmpty()) {
            session.setAttribute("error", "All fields are required.");
            response.sendRedirect("editSavedTrip.jsp?savedTripID=" + savedTripID);
            return;
        }

        // Update the trip in the database
        try {
            savedTripDAO.updateSavedTripDetails(savedTripID, newSavedTripName, newStartLocation, newDestination, label);
            response.sendRedirect("ViewSavedTripsServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: Unable to edit the trip.");
            response.sendRedirect("editSavedTrip.jsp?savedTripID=" + savedTripID);
        }
    }
}
