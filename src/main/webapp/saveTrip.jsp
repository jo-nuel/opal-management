<%@ page import="uts.isd.model.Route, uts.isd.model.dao.RouteDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>

<jsp:useBean id="routeDAO" class="uts.isd.model.dao.RouteDAO" scope="request">
    <jsp:setProperty name="routeDAO" property="conn" value="${applicationScope.conn}" />
</jsp:useBean>

<%
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
</body>
</html>
