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
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <style>
            .container {
                width: 90%; /* Make the container wider */
                margin: 0 auto;
            }

            .mainTable {
                width: 100%; /* Set table width to 100% */
                margin: 20px 0;
                border-collapse: collapse; /* Remove gaps between cells */
            }

            .mainTable th, .mainTable td {
                border: 1px solid #2D86A7;
                padding: 12px;
                text-align: left;
                font-size: 18px;
            }

            .mainTable th {
                background-color: #2D86A7;
                color: white;
            }

            .mainTable td {
                background-color: #87CEEB;
            }

            .buttonContainer {
                text-align: center;
                margin-top: 20px;
            }

            .mainButton {
                padding: 10px 30px; /* Normal size for the button */
                font-size: 18px;
            }
        </style>
    </head>
    <body>

        <!-- Opal Management System Header -->
        <div class="header">
            <p class="headerText">Opal Management System</p>
        </div>

        <!-- Filter Form -->
    <div class="filterContainer">
        <form action="EventControllerServlet" method="get">
            <input type="hidden" name="action" value="filter">
           
            <!-- Category Filter -->
            <label for="filterCategory">Filter by Category:</label>
            <select id="filterCategory" name="filterCategory" class="formInput">
                <option value="" disabled selected>Select a category</option>
                <option value="Concert">Concert</option>
                <option value="Sports">Sports</option>
                <option value="Maintenance">Maintenance</option>
                <option value="Festival">Festival</option>
                <option value="Public Gathering">Public Gathering</option>
            </select>
            
            <!-- Date Filter -->
            <label for="filterDate">Filter by Date:</label>
            <input type="date" id="filterDate" name="filterDate" class="formInput">
    
            
            <!-- Location Filter -->
            <label for="filterLocation">Filter by Location:</label>
            <input type="text" id="filterLocation" name="filterLocation" class="formInput" placeholder="Enter location">
            
            <!-- Submit Filter Button -->
            <input type="submit" class="formButton" value="Apply Filter">
        </form>
        </div>
        <br>
        <!-- Error message if filter retrieves no events -->
        <c:if test="${not empty errorMessage}">
            <div class="error">
                <p>${errorMessage}</p>
            </div>
        </c:if>
    

        <!-- Start of Content -->
        <div class="container">
            <h1 class="h1">Available Events</h1>

            <!-- Event Table -->
            <table class="mainTable">
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Date</th> <!-- New column for Date -->
                        <th>Location</th> <!-- New column for Location -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="event" items="${events}">
                        <tr>
                            <td>${event.name}</td>
                            <td>${event.category}</td>
                            <td>${event.description}</td>
                            <td>${event.date}</td> <!-- Displaying Date -->
                            <td>${event.location}</td> <!-- Displaying Location -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Back Button -->
            <div class="buttonContainer">
                <a href="main.jsp" class="mainButton">Back to Main Menu</a>
            </div>
        </div>

        <!-- End of Content -->
    </body>
</html>
