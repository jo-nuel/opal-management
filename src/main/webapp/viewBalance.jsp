<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.OpalCard"%>
<html>
<head>
    <title>Opal Card Balance</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>Opal Card Balance</h1>
    <c:if test="${balance != null}">
        <p>Balance: $${balance}</p>
    </c:if>
    <form action="BalanceTopUpServlet" method="POST">
        <input type="hidden" name="cardNumber" value="${param.cardNumber}">
        <label for="amount">Top-Up Amount:</label>
        <input type="number" name="amount" required>
        <button type="submit">Top Up</button>
    </form>
</body>
</html>
