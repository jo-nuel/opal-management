<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.Event" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Event> events = (ArrayList<Event>) request.getAttribute("events");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .headerText {
            font-size: 2em;
            font-weight: bold;
        }

        .addButton, .backButton {
            background-color: #007bff;
            color: white;
            margin: 30px auto;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }

        .addButton:hover, .backButton:hover {
            background-color: #0056b3;
        }

        .filterContainer {
            margin: 20px 0;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px; 
            margin-left: auto;
            margin-right: auto;
        }

        .eventTable th, .eventTable td {
            padding: 12px;
            text-align: center;
        }

        .eventTable th {
            background-color: #007bff;
            color: white;
        }

        .actionButton {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            border: none;
        }

        .actionButton:hover {
            background-color: #0056b3;
        }

        .deleteButton {
            background-color: #f44336;
        }

        .deleteButton:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <h1 class="headerText">Manage Events</h1>
    </div>

    <!-- Add Event Button -->
    <div class="container text-end">
        <a href="addEventForm.jsp" class="addButton">Add New Event</a>
    </div>

    <!-- Filter Section -->
    <div class="container filterContainer">
        <form action="EventControllerServlet" method="get">
            <input type="hidden" name="action" value="filter">
            <div class="row">
                <!-- ID Filter -->
                <div class="col-md-3">
                    <label for="filterId">Filter by ID:</label>
                    <input type="number" id="filterId" name="filterId" class="form-control formInput" placeholder="Enter event ID">
                </div>

                <!-- Category Filter -->
                <div class="col-md-3">
                    <label for="filterCategory">Filter by Category:</label>
                    <select id="filterCategory" name="filterCategory" class="form-select formInput">
                        <option value="" disabled selected>Select a category</option>
                        <option value="Concert">Concert</option>
                        <option value="Sports">Sports</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Festival">Festival</option>
                        <option value="Public Gathering">Public Gathering</option>
                    </select>
                </div>

                <!-- Date Filter -->
                <div class="col-md-3">
                    <label for="filterDate">Filter by Date:</label>
                    <input type="date" id="filterDate" name="filterDate" class="form-control formInput">
                </div>

                <!-- Location Filter -->
                <div class="col-md-3">
                    <label for="filterLocation">Filter by Location:</label>
                    <input type="text" id="filterLocation" name="filterLocation" class="form-control formInput" placeholder="Enter location">
                </div>

                <!-- Submit Button -->
                <div class="col-12 text-center mt-3">
                    <button type="submit" class="formButton">Apply Filter</button>
                </div>
            </div>
        </form>
    </div>

    <!-- Error Message if No Events -->
    <c:if test="${not empty errorMessage}">
        <div class="container alert alert-danger mt-3">
            <p>${errorMessage}</p>
        </div>
    </c:if>

    <!-- Events Table -->
    <div class="container">
        <table class="eventTable table table-striped table-hover mt-4">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="event" items="${events}">
                    <tr>
                        <td>${event.id}</td>
                        <td>${event.name}</td>
                        <td>${event.category}</td>
                        <td>${event.description}</td>
                        <td>${event.date}</td>
                        <td>${event.location}</td>
                        <td>
                            <a href="EventControllerServlet?action=edit&id=${event.id}" class="actionButton">Edit</a>
                            <form action="EventControllerServlet" method="post" style="display:inline;" onsubmit="return confirmDelete(${event.id})">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${event.id}">
                                <button type="submit" class="actionButton deleteButton">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Go Back Button -->
    <div class="container text-start mt-4">
        <a href="adminMain.jsp" class="backButton">Go Back to Admin Menu</a>
    </div>

    <!-- JavaScript for Confirmation -->
    <script type="text/javascript">
        function confirmDelete(eventId) {
            return confirm("Are you sure you want to delete event with ID " + eventId + "?");
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
