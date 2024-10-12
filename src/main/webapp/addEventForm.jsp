<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add New Event</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>

        <!-- Opal Management System Header -->
        <div class="header">
            <p class="headerText">Opal Management System</p>
        </div>

        <!-- Start of Content -->
        <br>
        <div class="formBox">
            <p class="formTitle">ADD NEW EVENT</p>
            
            <!-- Add Event Form -->
            <form action="EventControllerServlet" method="post">
                <input type="hidden" name="action" value="add">

                <!-- Name Field -->
                <label class="formParagraph" for="name">EVENT NAME</label>
                <br>
                <input type="text" id="name" name="name" class="formInput" required>
                <br><br>

                <!-- Category Field (Dropdown) -->
                <label class="formParagraph" for="category">CATEGORY</label>
                <br>
                <select id="category" name="category" class="formInput" required>
                    <option value="" disabled selected>Select a category</option>
                    <option value="Concert">Concert</option>
                    <option value="Sports">Sports</option>
                    <option value="Maintenance">Maintenance</option>
                    <option value="Festival">Festival</option>
                    <option value="Public Gathering">Public Gathering</option>
                </select>
                <br><br>

                <!-- Description Field -->
                <label class="formParagraph" for="description">DESCRIPTION</label>
                <br>
                <textarea id="description" name="description" class="formInput" rows="5" required></textarea>
                <br><br>

                <!-- Date Field (Date picker) -->
                <label class="formParagraph" for="date">EVENT DATE</label>
                <br>
                <input type="date" id="date" name="date" class="formInput" required>
                <br><br>

                <!-- Location Field -->
                <label class="formParagraph" for="location">LOCATION</label>
                <br>
                <input type="text" id="location" name="location" class="formInput" required>
                <br><br>

                <!-- Submit and Go Back Buttons -->
                <input class="formButton" type="submit" value="ADD EVENT">
                <a href="EventControllerServlet?action=list" class="formButton">CANCEL</a>
            </form>
        </div>
        <!-- End of Content -->
        
    </body>
</html>
