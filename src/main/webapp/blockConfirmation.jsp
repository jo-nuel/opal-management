<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Block Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #2D86A7;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 36px;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }
        .container p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }
        .backLink {
            text-align: center;
            margin-top: 30px;
        }
        .backLink a {
            color: #2D86A7;
            text-decoration: none;
            font-size: 20px;
            padding: 10px 20px;
            border: 2px solid #2D86A7;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .backLink a:hover {
            background-color: #2D86A7;
            color: white;
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

</body>
</html>



