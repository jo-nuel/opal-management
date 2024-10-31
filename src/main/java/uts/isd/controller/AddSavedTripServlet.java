package uts.isd.controller;

import uts.isd.model.SavedTrip;
import uts.isd.dao.SavedTripDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class AddSavedTripServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        SavedTripDAO savedTripDAO = (SavedTripDAO) session.getAttribute("savedTripDAO");
        String userID = (String) session.getAttribute("userID");

        if (userID == null) {
            session.setAttribute("error", "User is not logged in.");
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve parameters from the request
        String savedTripName = request.getParameter("savedTripName");
        String startLocation = request.getParameter("startLocation");
        String destination = request.getParameter("destination");
        String label = request.getParameter("label");
        System.out.println("Retrieved Label: " + label); // Debugging output

        // Debug: Check parameters
        System.out.println("Received parameters - savedTripName: " + savedTripName + ", startLocation: " + startLocation
                + ", destination: " + destination + ", label: " + label);

        // Validate required fields
        if (savedTripName == null || startLocation == null || destination == null || savedTripName.isEmpty()
                || startLocation.isEmpty() || destination.isEmpty()) {
            session.setAttribute("error", "All fields are required.");
            response.sendRedirect("addSavedTrip.jsp");
            return;
        }

        // Create and add the new SavedTrip
        SavedTrip newTrip = new SavedTrip(0, savedTripName, startLocation, destination, userID, label);
        System.out.println("Label in SavedTrip object: " + newTrip.getLabel()); // Another debugging output

        try {
            savedTripDAO.addSavedTrip(newTrip);
            response.sendRedirect("ViewSavedTripsServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: Unable to save the trip.");
            response.sendRedirect("addSavedTrip.jsp");
        }
    }
}
