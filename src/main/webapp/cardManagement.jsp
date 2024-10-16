<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.OpalCard"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Opal Cards</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Consistent styles with main.jsp */
        .header {
            background-color: #2D86A7;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .headerText {
            font-size: 48px;
            font-weight: bold;
            font-family: Arial, sans-serif;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        th, td {
            padding: 10px;
            border: 1px solid #2D86A7;
            text-align: center;
        }
        th {
            background-color: #2D86A7;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .actionButton {
            padding: 10px;
            background-color: #2D86A7;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }
        .actionButton:hover {
            background-color: #65BFE1;
        }
        .buttonContainer {
            text-align: center;
            margin: 20px 0;
        }
        .backButton {
            background-color: #2D86A7;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            font-family: Arial, sans-serif;
        }
        .backButton:hover {
            background-color: #65BFE1;
        }
    </style>
</head>
<body>
    <div class="header">
        <p class="headerText">Manage Your Opal Cards</p>
    </div>

    <div class="container">
        <h3>Your Linked Cards</h3>
        <table>
            <thead>
                <tr>
                    <th>Card Number</th>
                    <th>Card Nickname</th>
                    <th>Balance</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="card" items="${sessionScope.cards}">
                    <tr>
                        <td>${card.cardNumber}</td>
                        <td>${card.cardName}</td>
                        <td>${card.balance}</td>
                        <td>${card.cardStatus}</td>
                        <td>
                            <form action="RenameOpalCardServlet" method="post" style="display:inline;">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <input type="text" name="newCardName" placeholder="Rename card">
                                <button type="submit" class="actionButton">Rename</button>
                            </form>
                            <form action="confirmDelete.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <button type="submit" class="actionButton">Remove</button>
                            </form>
                            <form action="ReportLostStolenServlet" method="POST">
                                <input type="hidden" name="cardID" value="${card.cardID}" />
                                <select name="status">
                                    <option value="LOST">Report as Lost</option>
                                    <option value="STOLEN">Report as Stolen</option>
                                </select>
                                <button type="submit">Report</button>
                            </form>
                            
                            <form action="BlockCardServlet" method="POST">
                                <input type="hidden" name="cardID" value="${card.cardID}" />
                                <button type="submit">Block Card</button>
                            </form>
                            
                            <form action="RequestReplacementServlet" method="POST">
                                <input type="hidden" name="cardID" value="${card.cardID}" />
                                <button type="submit">Request Replacement</button>
                            </form>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        

        <div class="buttonContainer">
            <a href="addCard.jsp" class="mainButton">Add New Opal Card</a>
        </div>

        <!-- Back to Main Page Button -->
        <div class="buttonContainer">
            <a href="main.jsp" class="backButton">Back to Main Page</a>
        </div>
    </div>
</body>
</html>
