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

public class BlockCardServlet extends HttpServlet {

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

            // Block the card
            opalCardDAO.blockCard(cardId);

            // Redirect to the block confirmation page, passing the card number
            response.sendRedirect("blockConfirmation.jsp?cardNumber=" + cardNumber);
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: Unable to block the card.");
            response.sendRedirect("error.jsp");
        }
    }
}


