<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
    <head>
        <title>Edit Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <!-- Imports -->
        <%
            User user = (User) session.getAttribute("user");
            String emptyError = (String) session.getAttribute("emptyError");
            String oldPasswordError = (String) session.getAttribute("oldPasswordError");
            String passwordError = (String) session.getAttribute("passwordError");
            String nameError = (String) session.getAttribute("nameError");
        %>
        <!-- End of Imports -->

        <!-- IOTBay Header -->
        <div class="header">
            <p class="headerText">Edit Details</p>
        </div>
        <div class="header2">
            <a href="main.jsp" class="header2Button">MAIN</a>
            <a href="logOut.jsp" class="header2Button">LOGOUT</a>
        </div>
        <!-- End of IOTBay Header -->

        <!-- Content -->
        <div>
            <form class="formBox" action="UserUpdateServlet" method="post">
                <p class="formTitle">Edit Account</p>

                <!-- Name field -->
                <label for="name" class="formParagraph">NAME</label>
                <br>
                <input type="text" id="name" name="name" value="${user.name}">
                <br><br><br>

                <!-- Email field (read-only) -->
                <label for="email" class="formParagraph">EMAIL</label>
                <br>
                <input type="text" id="email" name="email" value="${user.email}" readonly>
                <br><br><br>

                <!-- Old Password field -->
                <label for="oldPassword" class="formParagraph">OLD PASSWORD</label>
                <br>
                <input type="password" id="oldPassword" name="oldPassword" placeholder="Enter current password">
                <br><br><br>

                <!-- New Password field -->
                <label for="password" class="formParagraph">NEW PASSWORD</label>
                <br>
                <input type="password" id="password" name="password" placeholder="Enter new password">
                <br><br><br>

                <!-- Submit and Cancel buttons -->
                <input type="submit" value="Update" class="formButton">
                <br>
                <input type="submit" value="CANCEL" class="formButton" name="cancel">

                <!-- Error messages -->
                <p class="formError"><%= (emptyError != null ? emptyError : "") %></p>
                <p class="formError"><%= (oldPasswordError != null ? oldPasswordError : "") %></p>
                <p class="formError"><%= (passwordError != null ? passwordError : "") %></p>
                <p class="formError"><%= (nameError != null ? nameError : "") %></p>

                <!-- Hidden fields -->
                <input type="hidden" id="ID" name="ID" value="${user.ID}" readonly>
                <input type="hidden" id="status" name="status" value="${user.status}" readonly>
                <input type="hidden" id="role" name="role" value="${user.role}" readonly>
            </form>
        </div>
    </body>
</html>
