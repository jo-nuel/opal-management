package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class CardActionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int cardId = Integer.parseInt(request.getParameter("cardID"));
        String action = request.getParameter("action");  // Action will be 'block', 'lost', 'stolen', 'replacement'

        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        try {
            switch (action) {
                case "block":
                    opalCardDAO.blockCard(cardId);
                    break;
                case "lost":
                    opalCardDAO.reportLostOrStolenCard(cardId, "LOST");
                    break;
                case "stolen":
                    opalCardDAO.reportLostOrStolenCard(cardId, "STOLEN");
                    break;
                case "replacement":
                    opalCardDAO.requestReplacementCard(cardId);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid action");
            }

            // Redirect to cardManagement.jsp to show the updated status
            response.sendRedirect("cardManagement.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Unable to update card status.");
            response.sendRedirect("error.jsp");
        }
    }
}
