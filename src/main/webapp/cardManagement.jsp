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
        /* Embedded CSS */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #2D86A7;
            text-align: center;
        }
        th {
            background-color: #007cba;
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
                            
                            <!-- New Feature: Report as Lost/Stolen -->
                            <form action="LostServlet" method="post" style="display:inline;">
                                <input type="hidden" name="cardNumber" value="${card.cardNumber}">
                                <select name="reason">
                                    <option value="lost">Lost</option>
                                    <option value="stolen">Stolen</option>
                                </select>
                                <button type="submit" class="actionButton">Report</button>
                            </form>

                            <!-- New Feature: Block Card -->
                            <form action="BlockCardServlet" method="post" style="display:inline;">
                                <input type="hidden" name="cardNumber" value="${card.cardNumber}">
                                <button type="submit" class="actionButton">Block Card</button>
                            </form>

                            <!-- New Feature: Request Replacement -->
                            <form action="ReplacementCardServlet" method="post" style="display:inline;">
                                <input type="hidden" name="cardNumber" value="${card.cardNumber}">
                                <button type="submit" class="actionButton">Request Replacement</button>
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
    <table>
        <c:forEach var="card" items="${cards}">
            <tr>
                <td>${card.cardNumber}</td>
                <td>${card.cardName}</td>
                <td>${card.balance}</td>
                <td>${card.cardStatus}</td>
                <td>
                    <!-- Form to block the card -->
                    <form action="CardActionServlet" method="post">
                        <input type="hidden" name="cardID" value="${card.cardID}">
                        <input type="hidden" name="action" value="block">
                        <button type="submit">Block Card</button>
                    </form>
                </td>
                <td>
                    <!-- Form to report lost card -->
                    <form action="CardActionServlet" method="post">
                        <input type="hidden" name="cardID" value="${card.cardID}">
                        <input type="hidden" name="action" value="lost">
                        <button type="submit">Report Lost</button>
                    </form>
                </td>
                <td>
                    <!-- Form to report stolen card -->
                    <form action="CardActionServlet" method="post">
                        <input type="hidden" name="cardID" value="${card.cardID}">
                        <input type="hidden" name="action" value="stolen">
                        <button type="submit">Report Stolen</button>
                    </form>
                </td>
                <td>
                    <!-- Form to request replacement card -->
                    <form action="CardActionServlet" method="post">
                        <input type="hidden" name="cardID" value="${card.cardID}">
                        <input type="hidden" name="action" value="replacement">
                        <button type="submit">Request Replacement</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    
</body>
</html>
