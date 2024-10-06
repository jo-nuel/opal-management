<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Delete</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }
        .button {
            padding: 10px 20px;
            margin: 10px;
            background-color: #2D86A7;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #65BFE1;
        }
        .cancelButton {
            background-color: #ccc;
        }
        .cancelButton:hover {
            background-color: #999;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Are you sure you want to remove this Opal card?</h2>
        
        <!-- Card info (Optional: Display card number for clarity) -->
        <p>Card ID: ${param.cardID}</p>
        
        <!-- Confirm deletion -->
        <form action="DeleteOpalCardServlet" method="post">
            <input type="hidden" name="cardID" value="${param.cardID}">
            <button type="submit" class="button">Yes, Delete</button>
        </form>

        <!-- Cancel button to go back -->
        <form action="cardManagement.jsp" method="get">
            <button type="submit" class="button cancelButton">No, Cancel</button>
        </form>
    </div>
</body>
</html>
