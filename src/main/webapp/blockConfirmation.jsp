<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Block Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #2D86A7;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            font-size: 1.75rem;
            color: #007bff;
            margin-bottom: 20px;
        }
        .container p {
            font-size: 1.125rem;
            color: #555;
        }
        .backLink {
            text-align: center;
            margin-top: 30px;
        }
        .backLink a {
            color: #fff;
            background-color: #2D86A7;
            text-decoration: none;
            font-size: 1.125rem;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .backLink a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Card Block Confirmation</h1>
    </div>

    <div class="container">
        <h2>Block Successful!</h2>
        <p>Your card with number: <strong>${param.cardNumber}</strong> has been successfully blocked.</p>

        <div class="backLink">
            <a href="ListOpalCardsServlet">Back to Card Management</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
