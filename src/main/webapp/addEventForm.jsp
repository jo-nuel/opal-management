<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Event</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .formBox {
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: 40px auto;
            }
            .formTitle {
                font-size: 1.8em;
                margin-bottom: 20px;
                text-align: center;
                color: #007bff;
            }
            .formInput, .form-select {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
                border: 1px solid #ced4da;
            }
            .formButton {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                font-size: 1.1em;
            }
            .formButton:hover {
                background-color: #0056b3;
            }
            .cancelButton {
                background-color: #6c757d;
            }
            .cancelButton:hover {
                background-color: #5a6268;
            }
        </style>
    </head>

    <body>
        <!-- Add New Event Form -->
        <div class="container">
            <div class="formBox">
                <h2 class="formTitle">Add New Event</h2>
                <form action="EventControllerServlet" method="post">
                    <input type="hidden" name="action" value="add">

                    <!-- Name Field -->
                    <label for="name">Event Name</label>
                    <input type="text" id="name" name="name" class="formInput" required>

                    <!-- Category Field (Dropdown) -->
                    <label for="category">Category</label>
                    <select id="category" name="category" class="form-select" required>
                        <option value="" disabled selected>Select a category</option>
                        <option value="Concert">Concert</option>
                        <option value="Sports">Sports</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Festival">Festival</option>
                        <option value="Public Gathering">Public Gathering</option>
                    </select>

                    <!-- Description Field -->
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="formInput" rows="4" required></textarea>

                    <!-- Date Field (Date picker) -->
                    <label for="date">Event Date</label>
                    <input type="date" id="date" name="date" class="formInput" required>

                    <!-- Location Field -->
                    <label for="location">Location</label>
                    <input type="text" id="location" name="location" class="formInput" required>

                    <!-- Submit and Cancel Buttons -->
                    <button type="submit" class="formButton">Add Event</button>
                    <a href="EventControllerServlet?action=list" class="formButton cancelButton">Cancel</a>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
