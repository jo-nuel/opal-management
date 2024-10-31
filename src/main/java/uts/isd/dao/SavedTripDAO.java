package uts.isd.dao;

import uts.isd.model.SavedTrip;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SavedTripDAO {
    private Connection conn;

    public SavedTripDAO(Connection conn) {
        this.conn = conn;
    }

    // Add a new saved trip with label
    public void addSavedTrip(SavedTrip trip) throws SQLException {
        String query = "INSERT INTO SavedTrip (savedTripName, startLocation, destination, userID, label) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, trip.getSavedTripName());
            stmt.setString(2, trip.getStartLocation());
            stmt.setString(3, trip.getDestination());
            stmt.setString(4, trip.getUserID());
            stmt.setString(5, trip.getLabel());
            stmt.executeUpdate();
        }
    }

    // Retrieve all saved trips for a specific user
    public List<SavedTrip> getTripsByUserID(String userID) throws SQLException {
        List<SavedTrip> trips = new ArrayList<>();
        String query = "SELECT * FROM SavedTrip WHERE userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                SavedTrip trip = new SavedTrip(
                        rs.getInt("savedTripID"),
                        rs.getString("savedTripName"),
                        rs.getString("startLocation"),
                        rs.getString("destination"),
                        rs.getString("userID"),
                        rs.getString("label"));
                trips.add(trip);
            }
        }
        return trips;
    }

    // Retrieve all saved trips for a specific user with a specific label
    public List<SavedTrip> getTripsByUserIDAndLabel(String userID, String label) throws SQLException {
        List<SavedTrip> trips = new ArrayList<>();
        String query = "SELECT * FROM SavedTrip WHERE userID = ? AND label = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userID);
            stmt.setString(2, label);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                SavedTrip trip = new SavedTrip(
                        rs.getInt("savedTripID"),
                        rs.getString("savedTripName"),
                        rs.getString("startLocation"),
                        rs.getString("destination"),
                        rs.getString("userID"),
                        rs.getString("label"));
                trips.add(trip);
            }
        }
        return trips;
    }

    // Update saved trip details
    public void updateSavedTripDetails(String savedTripID, String newSavedTripName, String newStartLocation,
            String newDestination, String label) throws SQLException {
        String query = "UPDATE SavedTrip SET savedTripName = ?, startLocation = ?, destination = ?, label = ? WHERE savedTripID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newSavedTripName);
            stmt.setString(2, newStartLocation);
            stmt.setString(3, newDestination);
            stmt.setString(4, label);
            stmt.setString(5, savedTripID);
            stmt.executeUpdate();
        }
    }

    // Delete a saved trip by savedTripID
    public void deleteSavedTrip(String savedTripID) throws SQLException {
        String query = "DELETE FROM SavedTrip WHERE savedTripID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, savedTripID);
            stmt.executeUpdate();
        }
    }
}
