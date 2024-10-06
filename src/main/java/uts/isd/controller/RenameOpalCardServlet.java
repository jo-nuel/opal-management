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
import java.util.List;

public class RenameOpalCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int cardId = Integer.parseInt(request.getParameter("cardID"));
        String newCardName = request.getParameter("newCardName");

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            // Update the card name
            opalCardDAO.updateOpalCardName(cardId, newCardName);

            // Fetch the updated list of cards after renaming
            String userID = (String) session.getAttribute("userID"); // Fetch the user ID from session
            List<OpalCard> opalCards = opalCardDAO.getCardsByUserId(userID);

            // Update the session with the latest cards list
            session.setAttribute("cards", opalCards);

            // Redirect back to the card management page
            response.sendRedirect("cardManagement.jsp");

        } catch (SQLException e) {
            session.setAttribute("error", "Database error: Unable to rename Opal card.");
            response.sendRedirect("cardManagement.jsp");
        }
    }
}
