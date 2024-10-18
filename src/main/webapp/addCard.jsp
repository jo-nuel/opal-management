<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Opal Card</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* General Styles */
        body {
            background-color: #f8f9fa;
        }

        .header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 1.5em;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .form-container input, .form-container select {
            margin-bottom: 20px;
        }

        .form-button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #0056b3;
        }

        .cancel-button {
            width: 100%;
            padding: 10px;
            background-color: #f44336;
            border: none;
            color: white;
            font-size: 1.2rem;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
        }

        .cancel-button:hover {
            background-color: #e57373;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        Add New Opal Card
    </div>

    <!-- Form Container -->
    <div class="form-container">
        <form action="AddOpalCardServlet" method="post">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" class="form-control" required>

            <label for="securityCode">Security Code:</label>
            <input type="text" id="securityCode" name="cardSecurityCode" class="form-control" required>

            <label for="cardName">Card Nickname:</label>
            <input type="text" id="cardName" name="cardName" class="form-control">

            <label for="balance">Initial Balance:</label>
            <input type="number" id="balance" name="balance" class="form-control" step="0.01" required>

            <button type="submit" class="form-button">Add Card</button>
        </form>

        <!-- Cancel button redirects to cardManagement.jsp -->
        <form action="cardManagement.jsp" method="get">
            <button type="submit" class="cancel-button">Cancel</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
