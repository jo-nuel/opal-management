package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uts.isd.dao.ContactDAO;
import uts.isd.dao.DBConnector;

public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Connection conn = null;
        try {
            DBConnector dbConnector = new DBConnector();
            conn = dbConnector.openConnection();

            ContactDAO contactDAO = new ContactDAO(conn);
            contactDAO.saveContactSubmission(name, email, message);

            response.sendRedirect("main.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
        }
    }
}
