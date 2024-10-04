<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User userToModify = (User) session.getAttribute("userToModify");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modify User</title>
    </head>
    <body>
        <h1>Modify User Details</h1>
        <form action="AdminModifyUserServlet" method="post">
            Name: <input type="text" name="name" value="${userToModify.name}"><br>
            Email: <input type="text" name="email" value="${userToModify.email}" readonly><br>
            Role: <input type="text" name="role" value="${userToModify.role}"><br>
            <button type="submit">Save Changes</button>
        </form>
        <a href="adminListUsers.jsp">Cancel</a>
    </body>
</html>
