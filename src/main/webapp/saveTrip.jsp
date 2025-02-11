<%@ page import="uts.isd.model.Route, uts.isd.dao.RouteDAO" %>
<%@ page import="java.util.List" %>

<%
    // Retrieve RouteDAO from the session
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
    <title>Create Trip</title>
</head>
<body>
    <h2>Create a New Trip</h2>
    <form action="CreateTripServlet" method="post">
        <label>Trip Name:</label>
        <input type="text" name="tripName" required><br>

        <label>Select Routes:</label><br>
        <select name="routeIDs" multiple required>
            <% for (Route route : routes) { %>
                <option value="<%= route.getRouteID() %>">
                    <%= route.getStartLocation() %> to <%= route.getDestination() %> - Cost: $<%= route.getCost() %>
                </option>
            <% } %>
        </select><br>

        <input type="submit" value="Save Trip">
    </form>

    <br>
    <button onclick="window.location.href='viewRoutes.jsp'">Back to View Routes</button>
</body>
</html>
