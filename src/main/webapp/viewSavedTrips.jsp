<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.SavedTrip" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Saved Trips</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-nav .nav-link {
            color: white;
            font-size: 1.1em;
            margin-right: 20px;
            transition: color 0.3s ease, border-bottom 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107;
        }
        .container {
            margin-top: 30px;
        }
        .table {
            background-color: white;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

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
                    <li class="nav-item"><a class="nav-link" href="ListOpalCardsServlet">Manage Cards</a></li>
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
        <h2>My Saved Trips</h2>

        <!-- Label Filter Form -->
        <form action="ViewSavedTripsServlet" method="get" class="d-flex mb-3">
            <input type="text" name="labelFilter" class="form-control me-2" placeholder="Filter by label" value="${param.labelFilter}">
            <button type="submit" class="btn btn-primary">Filter</button>
            <a href="ViewSavedTripsServlet" class="btn btn-secondary ms-2">Clear Filter</a>
        </form>

        <a href="addSavedTrip.jsp" class="btn btn-success mb-3">Add New Trip</a>

        <table class="table table-striped table-hover mt-4">
            <thead class="table-dark">
                <tr>
                    <th>Trip Name</th>
                    <th>Start Location</th>
                    <th>Destination</th>
                    <th>Label</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="trip" items="${requestScope.trips}">
                    <tr>
                        <td>${trip.savedTripName}</td>
                        <td>${trip.startLocation}</td>
                        <td>${trip.destination}</td>
                        <td>${trip.label}</td>
                        <td>
                            <!-- Edit Trip -->
                            <form action="editSavedTrip.jsp" method="get" class="d-inline">
                                <input type="hidden" name="savedTripID" value="${trip.savedTripID}">
                                <button type="submit" class="btn btn-info btn-sm">Edit</button>
                            </form>

                            <!-- Delete Trip -->
                            <form action="DeleteSavedTripServlet" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this trip?');">
                                <input type="hidden" name="savedTripID" value="${trip.savedTripID}">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS for interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
