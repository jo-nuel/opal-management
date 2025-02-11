<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.OpalCard"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Opal Card Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body { background-color: #f8f9fa; }
        .navbar { background-color: #007bff; }
        .navbar-nav .nav-link { color: white; font-size: 1.1em; margin-right: 20px; transition: color 0.3s ease, border-bottom 0.3s ease; }
        .navbar-nav .nav-link:hover { color: #ffc107; }
        .container { margin-top: 30px; }
        .table { background-color: white; }
        .table th { background-color: #007bff; color: white; }
        .btn-primary, .btn-info, .btn-secondary, .btn-success, .btn-danger, .btn-warning { color: white; }
        @media (max-width: 768px) { .navbar-nav { flex-direction: column; text-align: center; } }
        .btn-primary { background-color: #0056b3; }
        .btn-info { background-color: #17a2b8; }
        .btn-secondary { background-color: #6c757d; }
        .btn-success { background-color: #28a745; }
        .btn-danger { background-color: #dc3545; }
        .btn-warning { background-color: #ffc107; color: black; }
    </style>
</head>
<body>

    <!-- Notification for Top-Up and Low Balance -->
    <c:if test="${not empty sessionScope.notification}">
        <div class="alert alert-info" role="alert">
            ${sessionScope.notification}
        </div>
        <c:remove var="notification" scope="session"/>
    </c:if>

    <c:if test="${not empty sessionScope.lowBalanceNotification}">
        <div class="alert alert-warning" role="alert">
            ${sessionScope.lowBalanceNotification}
        </div>
        <c:remove var="lowBalanceNotification" scope="session"/>
    </c:if>

    <!-- Header Navigation -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">Opal Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="main.jsp">Profile Settings</a></li>
                    <li class="nav-item"><a class="nav-link" href="ListOpalCardsServlet?userID=${user.ID}">Manage Cards</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewandTopUpBalance.jsp">Top-up</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserEventController">Events</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Travel History</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Trip Planner</a></li>
                    <li class="nav-item"><a class="nav-link" href="ViewSavedTripsServlet">Saved Trips</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq-en.jsp">F.A.Q</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="logOut.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <!-- Card Management Table -->
        <table class="table table-striped table-hover mt-4">
            <thead class="table-dark">
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
                            <!-- Rename Card -->
                            <form action="RenameOpalCardServlet" method="post" class="d-inline">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <input type="text" name="newCardName" placeholder="Rename card" class="form-control d-inline w-auto">
                                <button type="submit" class="btn btn-info btn-sm">Rename</button>
                            </form>

                            <!-- Remove Card -->
                            <form action="confirmDelete.jsp" method="post" class="d-inline">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                            </form>

                            <!-- Report Lost/Stolen -->
                            <form action="ReportLostStolenServlet" method="post" class="d-inline">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <select name="status" class="form-control d-inline w-auto">
                                    <option value="LOST">Lost</option>
                                    <option value="STOLEN">Stolen</option>
                                </select>
                                <button type="submit" class="btn btn-warning btn-sm">Report</button>
                            </form>

                            <!-- Block Card -->
                            <form action="BlockCardServlet" method="post" class="d-inline">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <button type="submit" class="btn btn-secondary btn-sm">Block</button>
                            </form>

                            <!-- Request Replacement -->
                            <form action="RequestReplacementServlet" method="post" class="d-inline">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <button type="submit" class="btn btn-primary btn-sm">Request Replacement</button>
                            </form>

                            <!-- Top-Up Button -->
                            <form action="TopUpLouisServlet" method="post" class="d-inline">
                                <input type="hidden" name="cardID" value="${card.cardID}">
                                <input type="number" name="topUpAmount" placeholder="Amount" class="form-control d-inline w-auto" min="1" required>
                                <button type="submit" class="btn btn-success btn-sm">Top-Up</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Link New Card Button -->
        <div class="text-center mt-4">
            <a href="addCard.jsp" class="btn btn-success">Link New Card</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
