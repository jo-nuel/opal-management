<%@page import="uts.isd.model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }
        .formBox {
            width: 40%;
            margin: 100px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .formTitle {
            text-align: center;
            font-size: 28px;
            color: #007bff;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .form-control {
            margin-bottom: 20px;
            padding: 10px;
            font-size: 16px;
        }
        .formButton {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .formButton:hover {
            background-color: #0056b3;
        }
        .formError {
            color: red;
            text-align: center;
            margin-top: 15px;
        }
        .goBack {
            width: 100%;
            padding: 10px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            display: block;
        }
        .goBack:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="formBox">
            <p class="formTitle">Log In</p>
            <form action="LoginServlet" method="post">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Enter your email" required>

                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" required>

                <input type="submit" value="Login" class="formButton">

                <!-- Go Back Button -->
                <a href="index.jsp" class="goBack">Go Back</a>
            </form>

            <!-- Display error messages -->
            <p class="formError">
                <%= (session.getAttribute("badLoginError") != null) ? session.getAttribute("badLoginError") : "" %>
            </p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
