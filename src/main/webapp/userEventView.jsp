<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.Event" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Event> events = (ArrayList<Event>) request.getAttribute("events");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Available Events</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .headerText {
            font-size: 36px;
            font-weight: bold;
        }
        .container {
            margin-top: 30px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .filterContainer {
            margin-bottom: 20px;
        }
        .formInput, .formButton {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 5px;
        }
        .formButton {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .formButton:hover {
            background-color: #0056b3;
        }
        .mainTable th, .mainTable td {
            padding: 15px;
            text-align: center;
        }
        .mainTable th {
            background-color: #007bff;
            color: white;
        }
        .mainTable td {
            background-color: #f1f1f1;
        }
        .buttonContainer {
            text-align: center;
            margin-top: 20px;
        }
        .mainButton {
            background-color: #007bff;
            color: white;
            padding: 10px 30px;
            border-radius: 5px;
            text-decoration: none;
        }
        .mainButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Opal Management System Header -->
    <div class="header">
        <p class="headerText">Opal Management System</p>
    </div>

    <!-- Filter Form -->
    <div class="container">
        <div class="filterContainer">
            <form action="EventControllerServlet" method="get">
                <input type="hidden" name="action" value="filter">
                
                <!-- Category Filter -->
                <div class="form-group">
                    <label for="filterCategory">Filter by Category:</label>
                    <select id="filterCategory" name="filterCategory" class="formInput form-select">
                        <option value="" disabled selected>Select a category</option>
                        <option value="Concert">Concert</option>
                        <option value="Sports">Sports</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Festival">Festival</option>
                        <option value="Public Gathering">Public Gathering</option>
                    </select>
                </div>
                
                <!-- Date Filter -->
                <div class="form-group">
                    <label for="filterDate">Filter by Date:</label>
                    <input type="date" id="filterDate" name="filterDate" class="formInput form-control">
                </div>
                
                <!-- Location Filter -->
                <div class="form-group">
                    <label for="filterLocation">Filter by Location:</label>
                    <input type="text" id="filterLocation" name="filterLocation" class="formInput form-control" placeholder="Enter location">
                </div>
                
                <!-- Submit Filter Button -->
                <button type="submit" class="formButton">Apply Filter</button>
            </form>
        </div>

        <!-- Error message if no events are found -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <!-- Event Table -->
        <h2 class="text-center">Available Events</h2>
        <table class="table table-striped table-hover mainTable">
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Location</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="event" items="${events}">
                    <tr>
                        <td>${event.name}</td>
                        <td>${event.category}</td>
                        <td>${event.description}</td>
                        <td>${event.date}</td>
                        <td>${event.location}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Back Button -->
        <div class="buttonContainer">
            <a href="main.jsp" class="mainButton">Back to Main Menu</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
