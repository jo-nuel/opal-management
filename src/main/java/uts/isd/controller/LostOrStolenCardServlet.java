package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LostOrStolenCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Retrieve the user ID from the session
        String userID = (String) session.getAttribute("userID");
        System.out.println("UserID: " + userID); // Debug log for user ID

        // Fetch request parameters
        String cardIDStr = request.getParameter("cardID");
        int cardID = Integer.parseInt(cardIDStr);
        String status = request.getParameter("status"); // Lost or Stolen

        // Error handling for userID
        if (userID == null) {
            System.out.println("UserID is null, redirecting to login.");
            session.setAttribute("error", "User is not logged in.");
            response.sendRedirect("login.jsp");
            return;
        }

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            // Call the DAO method to update the status to Lost or Stolen
            opalCardDAO.updateCardStatus(cardID, status);

            System.out.println("Card status successfully updated to " + status);
            // Redirect to the card management page after updating the card status
            response.sendRedirect("ListOpalCardsServlet");

        } catch (SQLException e) {
            e.printStackTrace(); // Log the SQL exception
            session.setAttribute("error", "Database error: Unable to update the card status.");
            response.sendRedirect("error.jsp");
        }
    }
}

