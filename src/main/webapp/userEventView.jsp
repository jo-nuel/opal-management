<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.Event" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Event> events = (ArrayList<Event>) request.getAttribute("userEvents");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Event List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        .buttonContainer {
            text-align: center;
            margin-top: 20px;
        }

        .backButton {
            padding: 10px 20px;
            background-color: #2196F3;
            color: white;
            border: none;
            text-decoration: none;
            cursor: pointer;
        }

        .backButton:hover {
            background-color: #1976D2;
        }

    </style>
</head>
<body>

    <div class="container">
        <h1>Available Events</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Description</th>
            </tr>
            <c:forEach var="event" items="${userEvents}">
                <tr>
                    <td>${event.id}</td>
                    <td>${event.name}</td>
                    <td>${event.category}</td>
                    <td>${event.description}</td>
                </tr>
            </c:forEach>
        </table>

        <!-- Go Back Button -->
        <div class="buttonContainer">
            <a href="main.jsp" class="backButton">Back to Main Menu</a>
        </div>
    </div>

</body>
</html>
