package uts.isd.controller;

import uts.isd.model.Trip;
import uts.isd.model.Route;
import uts.isd.model.dao.TripDAO;
import uts.isd.model.dao.RouteDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CreateTripServlet extends HttpServlet {
    private TripDAO tripDAO;
    private RouteDAO routeDAO;

    public void init() {
        Connection conn = (Connection) getServletContext().getAttribute("conn");
        tripDAO = new TripDAO(conn);
        routeDAO = new RouteDAO(conn);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripName = request.getParameter("tripName");
        String[] routeIDs = request.getParameterValues("routeIDs");
        String userID = ((HttpSession) request.getSession()).getAttribute("userID").toString();

        try {
            Trip trip = new Trip(0, tripName, userID); 
            List<Route> selectedRoutes = new ArrayList<>();

            for (String routeIDStr : routeIDs) {
                int routeID = Integer.parseInt(routeIDStr);
                selectedRoutes.add(routeDAO.getRouteById(routeID));
            }

            trip.getRoutes().addAll(selectedRoutes);
            tripDAO.saveTrip(trip);

            response.sendRedirect("trips.jsp");
        } catch (SQLException e) {
            throw new ServletException("Database error during trip creation", e);
        }
    }
}
