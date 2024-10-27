
package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.dao.*;

public class ConnServlet extends HttpServlet {
    private DBConnector db;
    private DBManager manager;
    private OpalCardDAO opalCardDAO;
    private SavedTripDAO savedTripDAO;
    private Connection conn;

    @Override // Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            db = new DBConnector();
            System.out.println("connection is working");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("manager") == null) {
            try {
                conn = db.openConnection();
                manager = new DBManager(conn);
                session.setAttribute("manager", manager);
                System.out.println("manager is set and isnt null");

                opalCardDAO = new OpalCardDAO(conn);
                savedTripDAO = new SavedTripDAO(conn);
                session.setAttribute("opalCardDAO", opalCardDAO);
                System.out.println("opalCardDAO is set and isnt null");
                session.setAttribute("savedTripDAO", savedTripDAO);
                System.out.println("savedTripDAO is set and isnt null");

            } catch (SQLException ex) {
                Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        // Use sendRedirect to avoid forwarding loops
        response.sendRedirect("index.jsp");
    }

    @Override
    public void destroy() {
        try {
            db.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
