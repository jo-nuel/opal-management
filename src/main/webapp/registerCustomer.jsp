<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            margin-top: 30px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }

        .formTitle {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }

        .formButton {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            width: 100%;
        }

        .formButton:hover {
            background-color: #0056b3;
        }

        .formError {
            color: red;
            font-size: 0.9rem;
            margin-top: 10px;
            text-align: center;
        }

        .form-control {
            margin-bottom: 20px;
        }

        a.formButton {
            display: inline-block;
            text-decoration: none;
            text-align: center;
        }
    </style>
</head>

<body>

    <!-- Header Section -->
    <div class="header">
        <p class="headerText">Opal Management System</p>
    </div>

    <!-- Customer Registration Form -->
    <div class="container">
        <p class="formTitle">Customer Registration</p>

        <!--Imports-->
        <%
            String emptyError = (String) session.getAttribute("emptyError");
            String emailError = (String) session.getAttribute("emailError");
            String nameError = (String) session.getAttribute("nameError");
            String passwordError = (String) session.getAttribute("passwordError");
            String createdError = (String) session.getAttribute("createdError");
            String phoneError = (String) session.getAttribute("phoneError");
        %>
        <!--End of Imports-->

        <!-- Display Error Messages -->
        <p class="formError"><%= (emptyError != null) ? emptyError : "" %></p>
        <p class="formError"><%= (emailError != null) ? emailError : "" %></p>
        <p class="formError"><%= (nameError != null) ? nameError : "" %></p>
        <p class="formError"><%= (passwordError != null) ? passwordError : "" %></p>

        <form action="RegisterCustomerServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Customer Email</label>
                <input type="text" id="email" name="email" class="form-control">
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">Customer Name</label>
                <input type="text" id="name" name="name" class="form-control">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Customer Password</label>
                <input type="password" id="password" name="password" class="form-control">
            </div>

            <!-- Submit Button -->
            <input type="submit" value="Submit" class="formButton">

            <!-- Go Back Button -->
            <a href="registerOption.jsp" class="formButton">Go Back</a>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
