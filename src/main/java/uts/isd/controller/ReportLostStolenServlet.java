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

public class ReportLostStolenServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int cardId = Integer.parseInt(request.getParameter("cardID"));
        String status = request.getParameter("status"); // "LOST" or "STOLEN"

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            // Fetch the card details based on cardID
            OpalCard card = opalCardDAO.getCardById(cardId); // Make sure this method works
            String cardNumber = card.getCardNumber();

            // Update the card status to LOST or STOLEN
            opalCardDAO.reportLostOrStolenCard(cardId, status);

            // Redirect to the confirmation page, passing the card number and status
            response.sendRedirect("reportConfirmation.jsp?cardNumber=" + cardNumber + "&status=" + status);
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: Unable to report card as lost/stolen.");
            response.sendRedirect("error.jsp");
        }
    }
}
