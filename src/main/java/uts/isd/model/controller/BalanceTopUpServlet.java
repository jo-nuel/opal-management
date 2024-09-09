package uts.isd.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException; 
import java.sql.SQLException;
import uts.isd.model.OpalCard;
import uts.isd.model.dao.DBManager;

public class BalanceTopUpServlet extends HttpServlet
{
  protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    HttpSession session = request.getSession();
    DBManager manager = (DBManager) session.getAttribute("manager");
    String cardNumber = request.getParameter("cardNumber");

    try 
    {
        OpalCard card = manager.getCardByNumber(cardNumber);
        request.setAttribute("balance", card.getBalance());
        request.getRequestDispatcher("/balance.jsp").forward(request, response);
    } 

    catch (SQLException | NullPointerException ex)
    {
      ex.printStackTrace();
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving balance");
    }
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  throws ServletException, IOException
  {
    HttpSession session = request.getSession();
    DBManager manager = (DBManager) session.getAttribute("manager");
    String cardNumber = request.getParameter("cardNumber");
    double topUpAmount = Double.parseDouble(request.getParameter("amount"));

    try
    {
      manager.topUpCard(cardNumber, topUpAmount);
      response.sendRedirect("balance.jsp?cardNumber=" + cardNumber);
    }

    catch (SQLException | NullPointerException ex)
    {
      ex.printStackTrace();
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving balance");
    }
  }
}
