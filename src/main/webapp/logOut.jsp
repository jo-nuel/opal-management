<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0;
            }
            .logout-container {
                max-width: 400px;
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .logout-container h1 {
                font-size: 24px;
                margin-bottom: 20px;
            }
            .button-container {
                display: flex;
                justify-content: space-between;
            }
            .formButton {
                padding: 10px;
                width: 48%;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .formButton:hover {
                background-color: #0056b3;
            }
            .cancelButton {
                background-color: red;
            }
            .cancelButton:hover {
                background-color: #5a6268;
            }
        </style>
    </head>

    <body>
        <!--Imports-->
        <%
        User user = (User) session.getAttribute("user");
        String userRole = user != null ? user.getRole() : "";
        %>
        <!--End of Imports-->
        
        <!--Start of Content -->
        <div class="logout-container">
            <h1>Are you sure you want to log out?</h1>
            <form action="LogOutServlet">
                <!-- Hidden field to send the user’s email -->
                <input type="hidden" id="email" name="email" value="<%=user.getEmail()%>"> 

                <div class="button-container">
                    <!-- Cancel button logic -->
                    <a href="<%= userRole.equals("admin") ? "adminMain.jsp" : "main.jsp" %>" class="formButton cancelButton">Cancel</a>
                    <input type="submit" value="Logout" class="formButton">
                </div>
            </form>
        </div>
        <!--End of Content -->

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
