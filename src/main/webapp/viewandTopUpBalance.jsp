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

        .headerText {
            font-size: 24px;
            text-align: center;
            color: #2D86A7;
            margin-bottom: 20px;
        }

        .balanceContainer {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin: 15px 0;
        }

        .form-group label {
            font-size: 18px;
            margin-right: 10px;
        }

        .form-group input {
            font-size: 16px;
            padding: 5px;
            width: calc(100% - 20px);
            box-sizing: border-box;
        }

        .buttonContainer {
            text-align: right;
            margin-top: 20px;
        }

        .button {
            background-color: #2D86A7;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-family: Arial, sans-serif;
        }

        .button:hover {
            background-color: #65BFE1;
        }

        /* Back button styling */
        .backButtonContainer {
            text-align: left;
            margin-top: 20px;
        }

        .backButton {
            background-color: #2D86A7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-family: Arial, sans-serif;
        }

        .backButton:hover {
            background-color: #65BFE1;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        <p class="headerText">Balance/Top-up My Opal Card</p>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="balanceContainer">
            <h2>My Opal Card Balance</h2>
            <h3>Current Balance: $</h3>
        </div>

        <form action="TopUpServlet" method="post">
            <input type="hidden" name="cardNumber" value="">

            <div class="form-group">
                <label for="topUpAmount">Enter Amount to Top-Up:</label>
                <input type="number" id="topUpAmount" name="topUpAmount" step="0.01" required>
            </div>

            <div class="buttonContainer">
                <input type="submit" value="Top-Up Balance" class="button">
            </div>
        </form>

        <!-- Back to Main Page Button -->
        <div class="backButtonContainer">
            <a href="main.jsp" class="backButton">Back to Main Page</a>
        </div>
    </div>
</body>
</html>
