package uts.isd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import uts.isd.model.*;
import uts.isd.dao.*;
import java.util.List;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/viewTrips")
public class ViewTripsServlet extends HttpServlet {
    private TripDAO tripDAO;


    public void init() {
        Connection conn = (Connection) getServletContext().getAttribute("conn");
        if (conn != null) 
        {
            tripDAO = new TripDAO(conn);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");


        try {
            List<Trip> trips = tripDAO.getTripsByUser(userID);
            request.setAttribute("trips", trips);
            request.getRequestDispatcher("tripSummary.jsp").forward(request, response);
        } catch (Exception e) 
        {
            throw new ServletException("Error viewing trips", e);
        }
    }
}
