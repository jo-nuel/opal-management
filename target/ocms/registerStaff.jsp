<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Registration</title>
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
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        .form-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
        .form-control {
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            margin: 15px 0;
            padding: 10px;
            border: none;
            border-radius: 5px;
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
        .error {
            color: red;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <!--Imports-->
    <%
        String emptyError = (String) session.getAttribute("emptyError");
        String emailError = (String) session.getAttribute("emailError");
        String nameError = (String) session.getAttribute("nameError");
        String passwordError = (String) session.getAttribute("passwordError");
        String createdError = (String) session.getAttribute("createdError");
        String keyError = (String) session.getAttribute("keyError");
        String phoneError = (String) session.getAttribute("phoneError");
    %>
    <!--End of Imports-->

    <!-- Header Section -->
    <div class="header">
        <p class="headerText">Opal Management System</p>
    </div>

    <!-- Main Content Section -->
    <div class="container">
        <h2 class="form-title">Staff Registration</h2>

        <form action="RegisterStaffServlet" method="post">
            <!-- Staff Password Field -->
            <label for="staffPassword">Staff Password</label>
            <input type="password" id="staffPassword" name="staffPassword" class="form-control" required>

            <!-- Email Field -->
            <label for="email">Email</label>
            <input type="text" id="email" name="email" class="form-control" required>

            <!-- Name Field -->
            <label for="name">Name</label>
            <input type="text" id="name" name="name" class="form-control" required>

            <!-- Password Field -->
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>

            <!-- Error Messages -->
            <div class="error">
                <%= (emptyError != null ? emptyError : "") %>
                <%= (emailError != null ? emailError : "") %>
                <%= (nameError != null ? nameError : "") %>
                <%= (passwordError != null ? passwordError : "") %>
                <%= (createdError != null ? createdError : "") %>
                <%= (keyError != null ? keyError : "") %>
            </div>

            <!-- Submit Button -->
            <input type="submit" class="btn btn-custom" value="Register">

            <!-- Go Back Button -->
            <a href="registerOption.jsp" class="btn btn-custom btn-custom-back">Go Back</a>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
