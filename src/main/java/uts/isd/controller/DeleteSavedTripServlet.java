package uts.isd.controller;

import uts.isd.dao.SavedTripDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteSavedTripServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        SavedTripDAO savedTripDAO = (SavedTripDAO) session.getAttribute("savedTripDAO");

        String savedTripID = request.getParameter("savedTripID");

        if (savedTripID == null || savedTripID.isEmpty()) {
            session.setAttribute("error", "Saved Trip ID is required to delete a saved trip.");
            response.sendRedirect("viewSavedTrips.jsp");
            return;
        }

        // Delete the trip from the database
        try {
            savedTripDAO.deleteSavedTrip(savedTripID);
            response.sendRedirect("ViewSavedTripsServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: Unable to delete the trip.");
            response.sendRedirect("ViewSavedTripsServlet");
        }
    }
}
