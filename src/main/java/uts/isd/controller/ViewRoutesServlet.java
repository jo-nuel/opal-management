package uts.isd.controller;

import uts.isd.model.Route;
import uts.isd.model.dao.RouteDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ViewRoutesServlet extends HttpServlet {
    private RouteDAO routeDAO;

    public void init() {
        Connection conn = (Connection) getServletContext().getAttribute("conn");
        routeDAO = new RouteDAO(conn);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Route> routes = routeDAO.getAllRoutes();
            request.setAttribute("routes", routes);
            request.getRequestDispatcher("routes.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error retrieving routes", e);
        }
    }
}
