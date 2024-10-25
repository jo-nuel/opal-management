package uts.isd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import uts.isd.model.*;
import uts.isd.model.dao.*;

@WebServlet("/createTrip")
public class CreateTripServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        String tripName = request.getParameter("tripName");

        Trip trip = new Trip(null, tripName, userID);

        String[] routeIDs = request.getParameterValues("routeID");

        for (String routeID : routeIDs) {
            String startLocation = request.getParameter("startLocation_" + routeID);
            String destination = request.getParameter("destination_" + routeID);
            double cost = Double.parseDouble(request.getParameter("cost_" + routeID));

            Route route = new Route(routeID, startLocation, destination, cost);
            trip.addRoute(route);
        }

        try {
            TripDAO tripDAO = new TripDAO(DBConnection.getConnection());
            tripDAO.saveTrip(trip);
            response.sendRedirect("tripSummary.jsp?tripID=" + trip.getTripID());
        } catch (Exception e) {
            throw new ServletException("Error creating trip", e);
        }
    }
}
