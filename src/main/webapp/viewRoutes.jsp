<%@ page import="uts.isd.model.Route, uts.isd.dao.RouteDAO" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="routeDAO" class="uts.isd.dao.RouteDAO" scope="request">
    <jsp:setProperty name="routeDAO" property="conn" value="${applicationScope.conn}" />
</jsp:useBean>

<%
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
    <a href="saveTrip.jsp">
        <button type="button">Create a New Trip</button>
    </a>

</body>
</html>
