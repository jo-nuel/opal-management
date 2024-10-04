<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.Event" %>
<%
    Event event = (Event) request.getAttribute("event");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
</head>
<body>
    <h1>Edit Event</h1>
    
    <form action="EventControllerServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${event.id}">
        Name: <input type="text" name="name" value="${event.name}"><br>
        Category: <input type="text" name="category" value="${event.category}"><br>
        Description: <textarea name="description">${event.description}</textarea><br>
        <input type="submit" value="Update Event">
    </form>
    
    <a href="EventControllerServlet?action=list">Cancel</a>
</body>
</html>
