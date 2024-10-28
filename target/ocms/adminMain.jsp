<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Main Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        .headerText {
            font-size: 1.8em;
            font-weight: bold;
        }
        .buttonContainer {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 50px;
        }
        .mainButton {
            margin: 15px;
            padding: 20px;
            width: 250px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-size: 1.2em;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .mainButton:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        }
        p {
            margin: 0;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <p class="headerText">Opal Management System - Admin Main Menu</p>
    </div>

    <!-- Button Container -->
    <div class="buttonContainer">
        <a class="mainButton" href="AdminListUsersServlet">
            <p>View All Users</p>
        </a>
        
        <a class="mainButton" href="registerOption.jsp">
            <p>Register Users or Admins</p>
        </a>

        <!-- New button to manage Opal cards -->
        <a class="mainButton" href="AdminManageCardsServlet">
            <p>Manage All Opal Cards</p>
        </a>

        <a class="mainButton" href="EventControllerServlet?action=list">
            <p>Manage Events</p>
        </a>

        <a class="mainButton" href="logOut.jsp">
            <p>Log Out</p>
        </a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
