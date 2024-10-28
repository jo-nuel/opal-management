<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.AccessLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
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
            margin-right: 20px;
            transition: color 0.3s ease, border-bottom 0.3s ease; 
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107;
        }
        .mainTable {
            width: 80%;
            margin: 40px auto;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .mainTable th {
            background-color: #007bff;
            color: white;
        }
        .mainTable td {
            padding: 15px;
        }
        .buttonContainer {
            text-align: center;
            margin-top: 20px;
        }
        .btn-main {
            width: 180px;
            margin: 10px;
        }
    </style>
</head>

<body>
    <!-- Header Navigation (consistent with cardManagement.jsp) -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Opal Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="main.jsp">Profile Settings</a></li>
                    <li class="nav-item"><a class="nav-link" href="ListOpalCardsServlet?userID=${user.ID}">Manage Cards</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewandTopUpBalance.jsp">Top-up</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserEventController">Events</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Travel History</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewRoutes.jsp">Trip Planner</a></li>
                    <li class="nav-item"><a class="nav-link" href="ViewSavedTripsServlet">Saved Trips</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq-en.jsp">F.A.Q</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="logOut.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Account Information Table -->
    <div class="container">
        <table class="mainTable table table-striped table-bordered">
            <thead>
                <tr>
                    <th colspan="2" class="text-center">Account Information</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <c:set var="passwordLength" value="${fn:length(user.password)}" />
                        <c:forEach begin="1" end="${passwordLength}" var="i">
                            *
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td>Account Status</td>
                    <td>${user.status}</td>
                </tr>
            </tbody>
        </table>

        <!-- Action Buttons -->
        <div class="buttonContainer">
            <a href="userEdit.jsp" class="btn btn-info btn-main">Edit Details</a>

            <form action="UserDeleteController" method="post" onsubmit="return confirmDelete()" style="display:inline;">
                <input type="hidden" name="email" value="${user.email}">
                <button type="submit" class="btn btn-danger btn-main">Delete Account</button>
            </form>
        </div>
    </div>

    <!-- Confirmation Script -->
    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this account?");
        }
    </script>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
