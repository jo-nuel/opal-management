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

public class RequestReplacementServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int cardId = Integer.parseInt(request.getParameter("cardID"));

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            // Fetch the card details based on cardID
            OpalCard card = opalCardDAO.getCardById(cardId); // Make sure this method works
            String cardNumber = card.getCardNumber();

            // Request a replacement for the card
            opalCardDAO.requestReplacement(cardId);

            // Redirect to the replacement confirmation page, passing the card number
            response.sendRedirect("replacementConfirmation.jsp?cardNumber=" + cardNumber);
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: Unable to request card replacement.");
            response.sendRedirect("error.jsp");
        }
    }
}


