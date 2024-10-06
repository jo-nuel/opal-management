package uts.isd.controller;

import uts.isd.model.OpalCard;
import uts.isd.dao.OpalCardDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class AddOpalCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Retrieve the user ID from session as a String
        String userID = (String) session.getAttribute("userID");
        System.out.println("UserID: " + userID); // Debug log for user ID

        // Fetch request parameters
        String cardNumber = request.getParameter("cardNumber");
        String cardName = request.getParameter("cardName");
        String balanceStr = request.getParameter("balance");
        Double balance = null;

        try {
            balance = Double.parseDouble(balanceStr);
        } catch (NumberFormatException e) {
            // Handle invalid input for balance, e.g., set a default value or return an
            // error
            session.setAttribute("error", "Invalid balance value.");
            response.sendRedirect("addCard.jsp");
            return;
        }
        String cardSecurityCode = request.getParameter("cardSecurityCode");
        String cardStatus = "ACTIVE";

        // Error handling for userID
        if (userID == null) {
            System.out.println("UserID is null, redirecting to login.");
            session.setAttribute("error", "User is not logged in.");
            response.sendRedirect("login.jsp");
            return;
        }

        // Log card details for debugging
        System.out.println("Card Number: " + cardNumber);
        System.out.println("Card Name: " + cardName);
        System.out.println("Balance: " + balance);
        System.out.println("Security Code: " + cardSecurityCode);

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            // Create a new OpalCard object (cardID will be set automatically)
            OpalCard newCard = new OpalCard(0, cardNumber, cardName, balance, cardStatus, userID, cardSecurityCode);
            opalCardDAO.addOpalCard(newCard); // Insert the card into the DB

            System.out.println("Card successfully added to the database.");
            // Redirect to the card management page after adding the card
            response.sendRedirect("ListOpalCardsServlet");

        } catch (SQLException e) {
            e.printStackTrace(); // Log the SQL exception
            session.setAttribute("error", "Database error: Unable to add the Opal card.");
            response.sendRedirect("addCard.jsp");
        }
    }
}
