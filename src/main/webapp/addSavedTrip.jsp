<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.SavedTrip" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Saved Trip</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Add a New Saved Trip</h2>

        <form action="AddSavedTripServlet" method="post">
            <div class="mb-3">
                <label for="savedTripName" class="form-label">Trip Name</label>
                <input type="text" id="savedTripName" name="savedTripName" class="form-control" required placeholder="E.g., Home to Office">
            </div>
            <div class="mb-3">
                <label for="startLocation" class="form-label">Start Location</label>
                <input type="text" id="startLocation" name="startLocation" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="destination" class="form-label">Destination</label>
                <input type="text" id="destination" name="destination" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="label" class="form-label">Label</label>
                <input type="text" id="label" name="label" class="form-control" placeholder="E.g., Work, Personal">
            </div>


            <button type="submit" class="btn btn-primary">Save Trip</button>
            <a href="ViewSavedTripsServlet" class="btn btn-secondary">Back to Saved Trips</a>
        </form>
    </div>
</body>
</html>
