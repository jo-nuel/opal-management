package uts.isd.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import uts.isd.model.Trip;
import uts.isd.model.Route;

public class TripDAO {
    private Connection conn;

    public TripDAO(Connection conn) {
        this.conn = conn;
    }

    // Create a new trip
    public void saveTrip(Trip trip) throws SQLException {
        // Convert route list to a comma-separated string
        StringBuilder routeIDs = new StringBuilder();
        for (Route route : trip.getRoutes()) {
            routeIDs.append(route.getRouteID()).append(",");
        }
        // Remove the trailing comma
        if (routeIDs.length() > 0) {
            routeIDs.setLength(routeIDs.length() - 1);
        }

        String query = "INSERT INTO Trips (tripID, tripName, userID, routeIDs) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, trip.getTripID());
        ps.setString(2, trip.getTripName());
        ps.setString(3, trip.getUserID());
        ps.setString(4, routeIDs.toString()); // Store route IDs as a string
        ps.executeUpdate();
    }

    // Retrieve trips for a user
    public List<Trip> getTripsByUser(String userID) throws SQLException {
        String query = "SELECT * FROM Trips WHERE userID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, userID);
        ResultSet rs = ps.executeQuery();

        List<Trip> trips = new ArrayList<>();
        while (rs.next()) {
            Trip trip = new Trip(rs.getInt("tripID"), rs.getString("tripName"), userID);
            // Retrieve route IDs from the string and add Route objects to the trip
            String[] routeIDArray = rs.getString("routeIDs").split(",");
            for (String id : routeIDArray) {
                Route route = new RouteDAO(conn).getRouteById(Integer.parseInt(id));
                if (route != null) {
                    trip.getRoutes().add(route);
                }
            }
            trips.add(trip);
        }
        return trips;
    }
}
