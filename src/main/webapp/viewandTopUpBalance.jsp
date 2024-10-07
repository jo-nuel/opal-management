<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.OpalCard" %>
<%@page import="uts.isd.dao.OpalCardDAO" %>
<%@page import="java.sql.Connection" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Connection conn = (Connection) application.getAttribute("dbConnection");
    OpalCardDAO dao = new OpalCardDAO(conn);
    String cardNumber = request.getParameter("cardNumber");
    OpalCard card = dao.getCardsByUserId((String) session.getAttribute("userID"))
                         .stream().filter(c -> c.getCardNumber().equals(cardNumber))
                         .findFirst().orElse(null);
    double balance = card != null ? card.getBalance() : 0.0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Opal Card Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px #ccc;
        }
        .button {
            background-color: #007cba;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #005f9a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Opal Card Balance</h2>
        <h3>Current Balance: $<%= balance %></h3>
        <form action="TopUpServlet" method="post">
            <input type="hidden" name="cardNumber" value="<%= cardNumber %>">
            <label for="topUpAmount">Enter Amount to Top-Up:</label>
            <input type="number" id="topUpAmount" name="topUpAmount" step="0.01" required>
            <br><br>
            <input type="submit" value="Top-Up Balance" class="button">
        </form>
    </div>
</body>
</html>
