<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.OpalCard" %>
<%@page import="uts.isd.dao.OpalCardDAO" %>
<%@page import="java.sql.Connection" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Connection conn = (Connection) application.getAttribute("dbConnection");
    OpalCardDAO dao = new OpalCardDAO(conn);
    String userID = (String) session.getAttribute("userID");
    List<OpalCard> opalCards = dao.getCardsByUserId(userID);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Opal Card</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
            width: 60%;
        }
        .headerText {
            font-size: 24px;
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        .cardList {
            margin-bottom: 20px;
        }
        .button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="headerText">Select Opal Card</h1>
        <div class="cardList">
            <form action="viewAndTopUpBalance.jsp" method="get">
                <label for="cardNumber">Select Opal Card:</label>
                <select id="cardNumber" name="cardNumber" class="form-control" required>
                    <c:forEach var="card" items="<%=opalCards%>">
                        <option value="${card.cardNumber}">${card.cardNumber} - Balance: $${card.balance}</option>
                    </c:forEach>
                </select>
                <div class="buttonContainer mt-3">
                    <input type="submit" value="View Balance" class="button">
                </div>
            </form>
        </div>
        <div class="backButtonContainer mt-3">
            <a href="main.jsp" class="btn btn-secondary">Back to Main Page</a>
        </div>
    </div>
</body>
</html>
