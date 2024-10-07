package uts.isd.controller;

import uts.isd.dao.OpalCardDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TopUpServlet")
public class TopUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = (Connection) getServletContext().getAttribute("dbConnection");
        OpalCardDAO dao = new OpalCardDAO(conn);

        String cardNumber = request.getParameter("cardNumber");
        double topUpAmount = Double.parseDouble(request.getParameter("topUpAmount"));

        try 
        {
            dao.topUpBalance(cardNumber, topUpAmount);
            request.setAttribute("message", "Balance successfully topped up!");
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred while topping up balance.");
        }
        request.getRequestDispatcher("topUp.jsp?cardNumber=" + cardNumber).forward(request, response);
    }
}
