package uts.isd.controller;

import uts.isd.dao.DBConnector;
import uts.isd.dao.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnServlet extends HttpServlet {
    private DBConnector dbConnector;
    private DBManager manager;
    private Connection conn;

    @Override
    public void init() throws ServletException {
        try {
            dbConnector = new DBConnector();  // Initialize DBConnector
            conn = dbConnector.openConnection(); // Open the connection
            manager = new DBManager(conn); // Initialize DBManager with the connection

            // Optionally log that the connection was successful
            System.out.println("DB connection established successfully.");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
            throw new ServletException("Unable to initialize DBConnector", ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("manager") == null) {
            session.setAttribute("manager", manager); // Store DBManager in session
        }

        // Redirect to index.jsp or wherever you need
        response.sendRedirect("index.jsp");
    }

    @Override
    public void destroy() {
        try {
            dbConnector.closeConnection(); // Close the connection when servlet is destroyed
        } catch (SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
