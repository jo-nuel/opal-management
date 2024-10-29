package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TopUpServlet")
public class TopUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve OpalCardDAO from the session
        HttpSession session = request.getSession();
        OpalCardDAO dao = (OpalCardDAO) session.getAttribute("opalCardDAO");

        // Check if the DAO is null (which would indicate ConnServlet hasn’t initialized it properly)
        if (dao == null) {
            throw new ServletException("OpalCardDAO not found in session. Ensure ConnServlet initializes it.");
        }

        String cardNumber = request.getParameter("cardNumber");
        double topUpAmount = Double.parseDouble(request.getParameter("topUpAmount"));

        try {
            // Use the existing OpalCardDAO to perform the top-up
            dao.topUpBalance(cardNumber, topUpAmount);
            request.setAttribute("message", "Balance successfully topped up!");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred while topping up balance.");
        }

        // Forward to JSP with a message
        request.getRequestDispatcher("topUp.jsp?cardNumber=" + cardNumber).forward(request, response);
    }
}
