<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.SavedTrip" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Saved Trip</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Saved Trip</h2>

        <form action="EditSavedTripServlet" method="post">
            <input type="hidden" name="savedTripID" value="${param.savedTripID}">

            <div class="mb-3">
                <label for="savedTripName" class="form-label">Trip Name</label>
                <input type="text" id="savedTripName" name="savedTripName" value="${param.savedTripName}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="startLocation" class="form-label">Start Location</label>
                <input type="text" id="startLocation" name="startLocation" value="${param.startLocation}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="destination" class="form-label">Destination</label>
                <input type="text" id="destination" name="destination" value="${param.destination}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="label" class="form-label">Label</label>
                <input type="text" id="label" name="label" value="${param.label}" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Update Trip</button>
            <a href="ViewSavedTripsServlet" class="btn btn-secondary">Back to Saved Trips</a>
        </form>
    </div>
</body>
</html>
