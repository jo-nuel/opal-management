<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #007bff;
        }

        .navbar-nav .nav-link {
            color: white;
            font-size: 1.1em;
            margin-right: 10px;
        }

        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }

        .headerText {
            font-size: 2rem;
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        .formButton {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .formButton:hover {
            background-color: #0056b3;
        }

        .formParagraph {
            font-weight: bold;
            color: #333;
        }

        .formError {
            color: red;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            margin-bottom: 10px;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
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

    <!-- Main Container -->
    <div class="container">
        <p class="headerText">Edit Account</p>
        <form action="UserUpdateServlet" method="post">
            <!-- Name field -->
            <label for="name" class="formParagraph">Name</label>
            <input type="text" id="name" name="name" value="${user.name}">

            <!-- Email field (read-only) -->
            <label for="email" class="formParagraph">Email</label>
            <input type="text" id="email" name="email" value="${user.email}" readonly>

            <!-- Old Password field -->
            <label for="oldPassword" class="formParagraph">Old Password</label>
            <input type="password" id="oldPassword" name="oldPassword" placeholder="Enter current password">

            <!-- New Password field -->
            <label for="password" class="formParagraph">New Password</label>
            <input type="password" id="password" name="password" placeholder="Enter new password">

            <!-- Error messages -->
            <p class="formError"><%= (emptyError != null ? emptyError : "") %></p>
            <p class="formError"><%= (oldPasswordError != null ? oldPasswordError : "") %></p>
            <p class="formError"><%= (passwordError != null ? passwordError : "") %></p>
            <p class="formError"><%= (nameError != null ? nameError : "") %></p>

            <!-- Hidden fields -->
            <input type="hidden" id="ID" name="ID" value="${user.ID}" readonly>
            <input type="hidden" id="status" name="status" value="${user.status}" readonly>
            <input type="hidden" id="role" name="role" value="${user.role}" readonly>

            <!-- Submit and Cancel buttons -->
            <div class="d-grid gap-2">
                <button type="submit" class="formButton">Update</button>
                <a href="main.jsp" class="btn btn-cancel">Cancel</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
