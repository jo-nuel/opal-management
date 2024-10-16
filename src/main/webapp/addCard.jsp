<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Opal Card</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Consistent styles with main.jsp */
        .header {
            background-color: #2D86A7;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .headerText {
            font-size: 48px;
            font-weight: bold;
            font-family: Arial, sans-serif;
        }
        .formContainer {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
            font-family: Arial, sans-serif;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .formButton, .cancelButton {
            width: 100%;
            padding: 10px;
            background-color: #2D86A7;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: Arial, sans-serif;
            margin-top: 10px;
        }
        .formButton:hover, .cancelButton:hover {
            background-color: #65BFE1;
        }
        .cancelButton {
            background-color: #f44336; /* Red background for cancel button */
        }
        .cancelButton:hover {
            background-color: #e57373; /* Light red on hover */
        }
    </style>
</head>
<body>
    <div class="header">
        <p class="headerText">Add New Opal Card</p>
    </div>

    <div class="container">
        <div class="formContainer">
            <form action="AddOpalCardServlet" method="post">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required>

                <label for="securityCode">Security Code:</label>
                <input type="text" id="securityCode" name="cardSecurityCode" required>

                <label for="cardName">Card Nickname:</label>
                <input type="text" id="cardName" name="cardName">

                <label for="balance">Initial Balance:</label>
                <input type="number" id="balance" name="balance" step="0.01" required>

                <button type="submit" class="formButton">Add Card</button>
            </form>

            <!-- Cancel button redirects to cardManagement.jsp -->
            <form action="cardManagement.jsp" method="get">
                <button type="submit" class="cancelButton">Cancel</button>
            </form>
        </div>
    </div>
</body>
</html>
