package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;
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
        OpalCardDAO opalCardDAO = (OpalCardDAO) session.getAttribute("opalCardDAO");
        int cardID = Integer.parseInt(request.getParameter("cardID"));
        String reportType = request.getParameter("status"); // LOST or STOLEN

        try {
            // Update card status in the database
            opalCardDAO.reportLostOrStolenCard(cardID, reportType);

            session.setAttribute("success", "Card reported as " + reportType.toLowerCase() + ".");
            response.sendRedirect("ListOpalCardsServlet");

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Error reporting card as " + reportType.toLowerCase() + ".");
            response.sendRedirect("error.jsp");
        }
    }
}
