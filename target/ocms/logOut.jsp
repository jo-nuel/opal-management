<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    

    <body>
        <!--Imports-->
        <%
        User user = (User) session.getAttribute("user");
        String userRole = user != null ? user.getRole() : "";
        %>
        <!--End of Imports-->
        
        <!--Opal Management System Header-->
        <div class="header">
            <p class="headerText">Opal Management System</p>
        </div>
        <!--End of Opal Management System Header-->
        
        <!--Start of Content -->
        <h1 class="h1">Are you sure you want to log out?</h1>
        <form action="LogOutServlet">
            <!-- Hidden field to send the user’s email -->
            <input type="hidden" id="email" name="email" value="<%=user.getEmail()%>"> <br>

            <div class="deleteBox">
                <!-- Cancel button logic -->
                <a href="<%= userRole.equals("admin") ? "adminMain.jsp" : "main.jsp" %>" class="formButton">Cancel</a>
                <input type="submit" value="Logout" class="formButton">
            </div>
        </form>
        <!--End of Content -->
    </body>
</html>
