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

public class AdminManageCardsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");

        // Retrieve filter parameters from request
        String userID = request.getParameter("userID");
        String cardNumber = request.getParameter("cardNumber");
        String cardStatus = request.getParameter("cardStatus");

        try {
            List<OpalCard> cards;
            // Call your existing search method if filters are provided
            cards = opalCardDAO.searchCardsWithFilters(userID, cardNumber, cardStatus);

            // Set the cards list in the request scope
            request.setAttribute("cards", cards);
            request.getRequestDispatcher("adminManageCards.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Unable to retrieve Opal cards.");
            response.sendRedirect("error.jsp");
        }
    }
}
