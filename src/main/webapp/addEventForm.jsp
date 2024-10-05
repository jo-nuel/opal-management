<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Event</title>
    <style>
        .formBox {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }

        .formTitle {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .formParagraph {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .formInput {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .formButton {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .formButton:hover {
            background-color: #45a049;
        }

        .cancelButton {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .cancelButton:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <div class="formBox">
        <form action="EventControllerServlet" method="post">
            <p class="formTitle">Add New Event</p>

            <input type="hidden" name="action" value="add">

            <!-- Name field -->
            <label for="name" class="formParagraph">Event Name</label>
            <input type="text" id="name" name="name" class="formInput" required>

            <!-- Category field -->
            <label for="category" class="formParagraph">Category</label>
            <input type="text" id="category" name="category" class="formInput" required>

            <!-- Description field -->
            <label for="description" class="formParagraph">Description</label>
            <textarea id="description" name="description" class="formInput" rows="5" required></textarea>

            <!-- Submit and Cancel buttons -->
            <button type="submit" class="formButton">Add Event</button>
            <a href="EventControllerServlet?action=list" class="cancelButton">Cancel</a>
        </form>
    </div>
</body>
</html>
