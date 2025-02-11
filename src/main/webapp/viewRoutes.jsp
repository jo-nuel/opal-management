<%@ page import="uts.isd.model.Route, uts.isd.dao.RouteDAO" %>
<%@ page import="java.util.List" %>

<%
    // Retrieve RouteDAO from the session, where it was set by ConnServlet
    RouteDAO routeDAO = (RouteDAO) session.getAttribute("routeDAO");

    // Check if routeDAO is null, which would indicate an issue with ConnServlet initialization
    if (routeDAO == null) {
        throw new ServletException("RouteDAO not found in session. Ensure ConnServlet initializes it.");
    }

    // Fetch the list of routes using the existing RouteDAO
    List<Route> routes = routeDAO.getAllRoutes();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Routes</title>
</head>
<body>
    <h2>Available Routes</h2>
    <table border="1">
        <tr>
            <th>Start Location</th>
            <th>Destination</th>
            <th>Cost</th>
            <th>Travel Time</th>
        </tr>
        <% for (Route route : routes) { %>
            <tr>
                <td><%= route.getStartLocation() %></td>
                <td><%= route.getDestination() %></td>
                <td>$<%= route.getCost() %></td>
                <td><%= route.getTravelTime() %> mins</td>
            </tr>
        <% } %>
    </table>

    <br>
    <button onclick="window.location.href='main.jsp'">Back to Main</button>
    <button onclick="window.location.href='saveTrip.jsp'">Create Trip</button>

</body>
</html>