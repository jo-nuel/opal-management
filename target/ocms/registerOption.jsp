<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Option</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #007bff;
            padding: 20px;
            text-align: center;
        }
        .headerText {
            font-size: 2rem;
            color: white;
            margin: 0;
        }
        .container {
            margin-top: 40px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            margin: 15px 0;
            padding: 15px;
            border: none;
            border-radius: 5px;
            display: block;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            color: white;
        }
        .btn-custom-back {
            background-color: #6c757d;
            color: white;
        }
        .btn-custom-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <p class="headerText">Opal Management System</p>
    </div>

    <!-- Main Content Section -->
    <div class="container">
        <h2>Select Registration Option</h2>

        <!-- Staff Registration Button -->
        <a href="registerStaff.jsp" class="btn btn-custom">Staff Registration</a>

        <!-- Customer Registration Button -->
        <a href="registerCustomer.jsp" class="btn btn-custom">Customer Registration</a>

        <!-- Go Back Button -->
        <%
            User loggedInUser = (User) session.getAttribute("user"); // Get the logged-in user from session
            String backPage = "index.jsp"; // Default back to index.jsp if no user or non-admin
            if (loggedInUser != null && "admin".equals(loggedInUser.getRole())) {
                backPage = "adminMain.jsp"; // Redirect to adminMain.jsp if user is an admin
            }
        %>
        <a href="<%= backPage %>" class="btn btn-custom btn-custom-back">Go Back</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
