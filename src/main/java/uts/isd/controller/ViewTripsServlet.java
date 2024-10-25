package uts.isd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import uts.isd.model.*;
import uts.isd.model.dao.*;

@WebServlet("/viewTrips")
public class ViewTripsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");

        try {
            TripDAO tripDAO = new TripDAO(DBConnection.getConnection());
            List<Trip> trips = tripDAO.getTripsByUser(userID);
            request.setAttribute("trips", trips);
            request.getRequestDispatcher("tripSummary.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error viewing trips", e);
        }
    }
}
