<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>

<html>
<head>
    <title>Opal Management System - Welcome</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .headerText {
            font-size: 32px;
            font-weight: bold;
        }
        .welcome-text {
            text-align: center;
            margin-top: 40px;
            font-size: 24px;
            color: #555;
        }
        .centreBox {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
        }
        .indexButton {
            display: inline-block;
            width: 250px;
            padding: 15px;
            margin: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .indexButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Opal Management System Header -->
    <div class="header">
        <p class="headerText">Opal Management System</p>
    </div>

    <!-- Content -->
    <div class="container centreBox">
        <a href="login.jsp" class="indexButton">Login</a>
        <a href="registerOption.jsp" class="indexButton">Register</a>
    </div>

    <jsp:include page="/ConnServlet" />

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
