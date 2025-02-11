package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;
import uts.isd.model.OpalCard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class TopUpLouisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        // Retrieve the card ID and top-up amount from the request
        int cardId = Integer.parseInt(request.getParameter("cardID"));
        String topUpAmountStr = request.getParameter("topUpAmount");

        double topUpAmount;
        try {
            topUpAmount = Double.parseDouble(topUpAmountStr);
        } catch (NumberFormatException e) {
            session.setAttribute("notification", "Invalid amount entered.");
            response.sendRedirect("ListOpalCardsServlet");
            return;
        }

        try {
            OpalCard card = opalCardDAO.getCardById(cardId);

            if (card == null) {
                session.setAttribute("notification", "Card not found.");
                response.sendRedirect("ListOpalCardsServlet");
                return;
            }

            // Check if the card status allows top-up
            if ("LOST".equals(card.getCardStatus()) || "STOLEN".equals(card.getCardStatus()) || "REPLACEMENT_REQUESTED".equals(card.getCardStatus())) {
                session.setAttribute("notification", "Top-up not allowed for cards marked as lost, stolen, or requesting replacement.");
                response.sendRedirect("ListOpalCardsServlet");
                return;
            }

            // Perform the top-up
            double newBalance = card.getBalance() + topUpAmount;
            opalCardDAO.topUpBalance(card.getCardNumber(), topUpAmount);

            // Set success notification with new balance
            session.setAttribute("notification", "Top-up of $" + topUpAmount + " was successful. New Balance: $" + newBalance);

            // Low balance notification if below threshold
            if (newBalance < 50) {
                session.setAttribute("lowBalanceNotification", "Warning: Balance is below $50.");
            }

            response.sendRedirect("ListOpalCardsServlet");

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("notification", "Database error occurred. Please try again.");
            response.sendRedirect("ListOpalCardsServlet");
        }
    }
}

