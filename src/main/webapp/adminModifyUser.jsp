<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.User"%>
<%
    User userToModify = (User) session.getAttribute("userToModify");  // Get the selected user to modify
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .header {
            text-align: center;
            padding: 20px 0;
        }

        .headerText {
            font-size: 2em;
            color: #007bff;
        }

        .formBox {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 40px auto;
        }

        .formTitle {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #007bff;
        }

        .formParagraph {
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .formButton {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        .formButton:hover {
            background-color: #0056b3;
        }

        a.formButton {
            display: inline-block;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <p class="headerText">Modify user: <%= userToModify != null ? userToModify.getID() : "" %></p>
    </div>

    <!-- Form Box -->
    <div class="formBox">
        <form action="AdminModifyUserServlet" method="post">
            <p class="formTitle"> Edit User Details </p>

            <!-- Email field (Visible but not editable) -->
            <label for="email" class="formParagraph">EMAIL</label>
            <input type="text" id="email" name="email" value="${userToModify.email}" readonly>

            <!-- ID field (Visible but not editable) -->
            <label for="id" class="formParagraph">ID</label>
            <input type="text" id="id" name="id" value="${userToModify.ID}" readonly>

            <!-- Name field (Editable) -->
            <label for="name" class="formParagraph">NAME</label>
            <input type="text" id="name" name="name" value="${userToModify.name}">

            <!-- Password field (Editable) -->
            <label for="password" class="formParagraph">PASSWORD</label>
            <input type="password" id="password" name="password" value="${userToModify.password}">

            <!-- Status field (Editable) -->
            <label for="status" class="formParagraph">STATUS</label>
            <input type="text" id="status" name="status" value="${userToModify.status}">

            <!-- Role field (Editable) -->
            <label for="role" class="formParagraph">ROLE</label>
            <input type="text" id="role" name="role" value="${userToModify.role}">

            <!-- Submit and Cancel buttons -->
            <input type="submit" value="Update" class="formButton">
            <a href="adminListUsers.jsp" class="formButton">Cancel</a>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
