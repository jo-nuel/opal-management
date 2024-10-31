<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<User> users = (ArrayList<User>) session.getAttribute("userList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List of Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .headerText {
            font-size: 2em;
            font-weight: bold;
        }

        .filterContainer {
            margin: 30px auto;
            width: 90%;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .formInput {
            margin-bottom: 15px;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .formButton {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .formButton:hover {
            background-color: #0056b3;
        }

        .userTable {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .userTable th, .userTable td {
            padding: 15px;
            text-align: center;
        }

        .userTable th {
            background-color: #007bff;
            color: white;
        }

        .userTable td {
            background-color: #f9f9f9;
        }

        .actionButton {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }

        .actionButton:hover {
            background-color: #0056b3;
        }

        .deleteButton {
            background-color: #dc3545;
        }

        .deleteButton:hover {
            background-color: #c82333;
        }

        .buttonContainer {
            margin-top: 30px;
            text-align: center;
        }

        .mainButton {
            padding: 12px 30px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .mainButton:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <p class="headerText">User Management</p>
    </div>

    <div class="container">

        <!-- Filter Form -->
        <div class="filterContainer">
            <form action="AdminListUsersServlet" method="get" class="row g-3">
                <div class="col-md-3">
                    <label for="filterId">Filter by ID:</label>
                    <input type="number" id="filterId" name="filterId" class="formInput" placeholder="Enter User ID">
                </div>
                <div class="col-md-3">
                    <label for="filterEmail">Filter by Email:</label>
                    <input type="text" id="filterEmail" name="filterEmail" class="formInput" placeholder="Enter User Email">
                </div>
                <div class="col-md-3">
                    <label for="filterRole">Filter by Role:</label>
                    <select id="filterRole" name="filterRole" class="formInput">
                        <option value="" disabled selected>Select Role</option>
                        <option value="Admin">Admin</option>
                        <option value="User">User</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="filterStatus">Filter by Status:</label>
                    <select id="filterStatus" name="filterStatus" class="formInput">
                        <option value="" disabled selected>Select Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="col-12 text-center mt-3">
                    <input type="submit" class="formButton" value="Apply Filter">
                </div>
            </form>
        </div>

        <!-- Error message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger text-center mt-3">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <!-- Users Table -->
        <table class="table table-hover userTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Status</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.ID}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>
                            <c:set var="passwordLength" value="${fn:length(user.password)}" />
                            <c:forEach begin="1" end="${passwordLength}" var="i">
                                *
                            </c:forEach>
                        </td>
                        <td>${user.status}</td>
                        <td>${user.role}</td>
                        <td>
                            <!-- Modify Button -->
                            <form action="AdminSelectUserServlet" method="get" class="d-inline">
                                <input type="hidden" name="email" value="${user.email}">
                                <button type="submit" class="actionButton">Modify</button>
                            </form>
                            <!-- Delete Button -->
                            <form action="AdminDeleteUserServlet" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete user ${user.name}?')">
                                <input type="hidden" name="email" value="${user.email}">
                                <button type="submit" class="actionButton deleteButton">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Back Button -->
        <div class="buttonContainer">
            <a href="adminMain.jsp" class="mainButton">Back to Admin Menu</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
