<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Opal Card Management - Lost or Stolen Card</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f8ff; /* Light blue background */
                color: #333;
                margin: 0;
                padding: 20px;
            }
    
            h1, h2 {
                color: #ff8c00; /* Orange headings */
            }
    
            form {
                background-color: #fff;
                border: 2px solid #ffcc00; /* Yellow border */
                border-radius: 10px;
                padding: 20px;
                max-width: 400px;
                margin-bottom: 20px;
            }
    
            label, select, input {
                display: block;
                margin-bottom: 10px;
                width: 100%;
            }
    
            input, select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
    
            button {
                background-color: #ffcc00; /* Yellow buttons */
                color: #333;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }
    
            button:hover {
                background-color: #ffa500; /* Darker orange on hover */
            }
    
            p {
                background-color: #e6f7ff; /* Light blue alert boxes */
                padding: 10px;
                border-radius: 5px;
                color: #004085;
                border: 1px solid #b8daff;
                display: none; /* Initially hidden */
            }
    
            .confirmation {
                display: block;
            }
    
            .container {
                max-width: 600px;
                margin: 0 auto;
            }
        </style>
    </head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opal Card Management - Alerts and Notifications</title>
</head>
<body>
    <h1>Opal Card Management - Alerts and Notifications</h1>

    
    <h2>Low Balance Alert</h2>
    <button id="lowBalanceButton">Low Balance</button>
    <p id="lowBalanceAlert"></p>

    
    <h2>Card Replacement Alert</h2>
    <button id="replacementAlertButton">Replacement Card</button>
    <p id="replacementAlert"></p>

    <script>
        t
        document.getElementById('lowBalanceButton').addEventListener('click', function() {
            document.getElementById('lowBalanceAlert').innerText = 'Alert: Your card balance is low. Please top-up!';
        });

        
        document.getElementById('replacementAlertButton').addEventListener('click', function() {
            document.getElementById('replacementAlert').innerText = 'Alert: Your replacement card request has been processed.';
        });
    </script>
</body>
</html>


