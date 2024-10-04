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
    <title>Admin Events</title>
    <style>
        .addButtonContainer {
            text-align: right;
            margin-bottom: 10px;
        }

        .addButton {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
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

        button {
            padding: 5px 10px;
            background-color: #f44336;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Manage Events</h1>

    <!-- Add Event Button (Top-right corner) -->
    <div class="addButtonContainer">
        <a href="addEventForm.jsp" class="addButton">Add New Event</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="event" items="${events}">
            <tr>
                <td>${event.id}</td>
                <td>${event.name}</td>
                <td>${event.category}</td>
                <td>${event.description}</td>
                <td>
                    <a href="EventControllerServlet?action=edit&id=${event.id}">Edit</a>
                    <form action="EventControllerServlet" method="post" style="display:inline;" onsubmit="return confirmDelete(${event.id})">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${event.id}">
                        <button type="submit">Delete</button>
                    </form>

                    <!-- JavaScript for the confirmation popup -->
                    <script type="text/javascript">
                        function confirmDelete(eventId) {
                            return confirm("Are you sure you want to delete event with ID " + eventId + "?");
                        }
                    </script>

                </td>
            </tr>
        </c:forEach>
    </table>
    <!-- Go Back Button (Bottom of the page) -->
    <div class="backButtonContainer">
        <a href="adminMain.jsp" class="backButton">Go Back to Admin Menu</a>
    </div>
</body>
</html>
