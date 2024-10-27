<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.AccessLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
    <head>
        <title>Main</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>


    <body>
        <!-- Imports -->
        <%
            User user = (User) session.getAttribute("user");
        %>
        <!--End of Imports-->
        
        <!--IOTBay Header-->
        <div class="header">
            <p class="headerText">Opal Management System</p>
        </div>
        <div class="header2">
            <a href="main.jsp" class="header2Button">Profile Settings</a>
            <a href="ListOpalCardsServlet?userID=${user.ID}" class="header2Button">CARDS</a>
            <a href="viewandTopUpBalance.jsp" class="header2Button">TOP-UP</a>
            <a href="UserEventController" class="header2Button">EVENTS</a>
            <a  class="header2Button">TRAVEL HISTORY</a>
            <a  class="header2Button">TRIP PLANNER</a>

            <a href="faq-en.jsp" class="header2Button">F.A.Q</a>
            <a href="contact.jsp" class="header2Button">CONTACT US</a>


            <a href="logOut.jsp" class="header2Button">LOGOUT</a>
        </div>
        <!--End of IOTBay Header-->
        
        <!-- Content-->
        
        
        
        <div>
            <br>

            <table class="mainTable">
                <thead>
                <th colspan="2" style="text-align: center;">Account Information</th>
                </thead>
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
                
             

            </table>

            
            <div class="buttonContainer">
                <a class="mainButton" href="userEdit.jsp">
                    <p>Edit details</p>
                </a>
                
          
                <form action="UserDeleteController" method="post" onsubmit="return confirmDelete()">
                    <input type="hidden" name="email" value="${user.email}">
                    <button type="submit" class="mainButton">
                        <p>Delete account</p>
                    </button>
                </form>
                
                <script type="text/javascript">
                    function confirmDelete() {
                        return confirm("Are you sure you want to delete this account?");
                    }
                </script>
                 
                <a class="mainButton" href="logOut.jsp">
                    <p>Log out</p>
                </a>
    
            </div>           

            </form>
        </div>
    </body> 
</html>
