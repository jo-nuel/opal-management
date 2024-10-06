package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;
import uts.isd.model.OpalCard;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

public class DeleteOpalCardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int cardId = Integer.parseInt(request.getParameter("cardID"));

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            // Delete the Opal card
            opalCardDAO.deleteOpalCard(cardId);

            // Re-fetch the updated list of Opal cards for the user
            String userID = (String) session.getAttribute("userID");
            List<OpalCard> opalCards = opalCardDAO.getCardsByUserId(userID);

            // Update the session with the updated list
            session.setAttribute("cards", opalCards);

            // Redirect to cardManagement.jsp to reflect the latest changes
            response.sendRedirect("cardManagement.jsp");

        } catch (SQLException e) {
            session.setAttribute("error", "Database error: Unable to delete Opal card.");
            response.sendRedirect("error.jsp");
        }
    }
}
