<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Admin Main Menu</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <!-- Imports -->
        <%
            User user = (User) session.getAttribute("user");
        %>
        <!--End of Imports-->
        
        <!--IOTBay Header-->
        <div class="header">
            <p class="headerText">Opal Management System - Admin Main Menu</p>
        </div>
        <!--End of IOTBay Header-->
        
        <!-- Content-->
        <div>
            <ul>
                <li><a href="AdminListUsersServlet">View All Users</a></li>
                <li><a href="registerOption.jsp">Register Users or Admins</a></li>
            </ul>
            <a href="logOut.jsp">Log Out</a>
        </div>
    </body> 
</html>
