<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.OpalCard"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Opal Cards for All Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .headerText {
            font-size: 24px;
            font-weight: bold;
        }
        .filter-container {
            text-align: center;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .filter-input, .filter-select {
            width: 20%;
            padding: 10px;
            margin: 5px;
            font-size: 1.1em;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .filter-button {
            padding: 10px 30px;
            font-size: 1.1em;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .filter-button:hover {
            background-color: #0056b3;
        }
        .table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .actionButton {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }
        .actionButton:hover {
            background-color: #0056b3;
        }
        .backButton {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .backButton:hover {
            background-color: #0056b3;
        }
        /* Responsive styles */
        @media (max-width: 768px) {
            .filter-input, .filter-select {
                width: 80%;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <p class="headerText">Manage All Opal Cards</p>
    </div>

    <!-- Filter Section -->
    <div class="filter-container">
        <form action="AdminManageCardsServlet" method="get">
            <input type="text" name="userID" placeholder="Filter by User ID" class="filter-input" />
            <input type="text" name="cardNumber" placeholder="Filter by Card Number" class="filter-input" />
            <select name="cardStatus" class="filter-select">
                <option value="">Filter by Status</option>
                <option value="ACTIVE">Active</option>
                <option value="BLOCKED">Blocked</option>
                <option value="LOST">Lost</option>
                <option value="STOLEN">Stolen</option>
            </select>
            <button type="submit" class="filter-button">Apply Filter</button>
        </form>
    </div>

    <!-- Opal Cards Table -->
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Card Number</th>
                <th>Nickname</th>
                <th>Balance</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="card" items="${requestScope.cards}">
                <tr>
                    <td>${card.userID}</td>
                    <td>${card.cardNumber}</td>
                    <td>${card.cardName}</td>
                    <td>${card.balance}</td>
                    <td>${card.cardStatus}</td>
                    <td>
                        <!-- Rename Card -->
                        <form action="RenameOpalCardServlet" method="post" style="display:inline;">
                            <input type="hidden" name="cardID" value="${card.cardID}">
                            <input type="text" name="newCardName" placeholder="Rename card" />
                            <button type="submit" class="actionButton">Rename</button>
                        </form>

                        <!-- Block Card -->
                        <form action="BlockCardServlet" method="post" style="display:inline;">
                            <input type="hidden" name="cardID" value="${card.cardID}">
                            <button type="submit" class="actionButton">Block</button>
                        </form>

                        <!-- Request Replacement -->
                        <form action="RequestReplacementServlet" method="post" style="display:inline;">
                            <input type="hidden" name="cardID" value="${card.cardID}">
                            <button type="submit" class="actionButton">Request Replacement</button>
                        </form>

                        <!-- Delete Card -->
                        <form action="DeleteOpalCardServlet" method="post" style="display:inline;">
                            <input type="hidden" name="cardID" value="${card.cardID}">
                            <button type="submit" class="actionButton">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Back to Admin Main Menu Button -->
    <div style="text-align: center; margin-top: 20px;">
        <a href="adminMain.jsp" class="backButton">Back to Admin Main Menu</a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
