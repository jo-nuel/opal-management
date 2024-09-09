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
    <title>Opal Card Management - Lost or Stolen Card</title>
</head>
<body>
    <h1>Opal Card Management - Lost or Stolen Card</h1>

    
    <h2>Report Lost or Stolen Card</h2>
    <form id="lostCardForm">
        <label for="cardNumber">Card Number:</label><br>
        <input type="text" id="cardNumber" name="cardNumber" required><br><br>

        <label for="reason">Reason:</label><br>
        <select id="reason" name="reason">
            <option value="lost">Lost</option>
            <option value="stolen">Stolen</option>
        </select><br><br>

        <button type="submit">Report Card</button>
    </form>

    <p id="reportConfirmation"></p>

    
    <h2>Temporarily Block Card</h2>
    <button id="blockCardButton">Block Card</button>
    <p id="blockConfirmation"></p>

    
    <h2>Request Replacement Card</h2>
    <button id="requestReplacementButton">Request Replacement Card</button>
    <p id="replacementConfirmation"></p>

    <script>
        
        document.getElementById('lostCardForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const cardNumber = document.getElementById('cardNumber').value;
            const reason = document.getElementById('reason').value;
            document.getElementById('reportConfirmation').innerText = `Card ${cardNumber} has been reported as ${reason}.`;
        });

        
        document.getElementById('blockCardButton').addEventListener('click', function() {
            document.getElementById('blockConfirmation').innerText = 'Your card has been temporarily blocked.';
        });

        
        document.getElementById('requestReplacementButton').addEventListener('click', function() {
            document.getElementById('replacementConfirmation').innerText = 'Your replacement card request has been submitted.';
        });
    </script>
</body>
</html>