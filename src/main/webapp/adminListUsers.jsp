<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<User> users = (ArrayList<User>) session.getAttribute("userList");
%>
<!-- the above scriptlet can be deleted since direclty retireving attribute via jstl. 
 if want to include the above do:
     request.setAttribute("users", users);  // Re-store it as a request attribute
  -->

<!DOCTYPE html>
<html>
    <head>
        <title>List of Users</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                border: 1px solid black;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>All Users</h1>
        <table>
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
                <!-- using jstl to directly retreve the set atrib from servlet:
                             session.setAttribute("userList", users); -->

                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.ID}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.password}</td>
                        <td>${user.status}</td>
                        <td>${user.role}</td>
                        <td>
                            <!-- Delete Button -->
                            <form action="AdminDeleteConfirmationServlet" method="post" style="display:inline;">
                                <input type="hidden" name="email" value="${user.email}">
                                <button type="submit">Delete</button>
                            </form>
                            <!-- Modify Button -->
                            <!-- Modify Button -->
                            <form action="AdminSelectUserServlet" method="get" style="display:inline;">
                                <input type="hidden" name="email" value="${user.email}">
                                <button type="submit">Modify</button>
                            </form>


                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="adminMain.jsp">Back to Admin Menu</a>
    </body>
</html>
