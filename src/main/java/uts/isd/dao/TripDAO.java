package uts.isd.model.dao;

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
        String query = "INSERT INTO Trips (tripID, tripName, userID) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, trip.getTripID());
        ps.setString(2, trip.getTripName());
        ps.setString(3, trip.getUserID());
        ps.executeUpdate();

        // Save routes for the trip
        for (Route route : trip.getRoutes()) {
            saveRoute(trip.getTripID(), route);
        }
    }

    // Save a route associated with a trip
    private void saveRoute(int tripID, Route route) throws SQLException {
        String query = "INSERT INTO Routes (routeID, tripID, startLocation, destination, cost, travelTime) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, route.getRouteID());
        ps.setString(2, tripID);
        ps.setString(3, route.getStartLocation());
        ps.setString(4, route.getDestination());
        ps.setDouble(5, route.getCost());
        ps.setInt(6, route.getTravelTime());
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
            Trip trip = new Trip(rs.getString("tripID"), rs.getString("tripName"), userID);
            trip.getRoutes().addAll(getRoutesByTrip(trip.getTripID()));
            trips.add(trip);
        }
        return trips;
    }

    // Retrieve routes associated with a trip
    private List<Route> getRoutesByTrip(String tripID) throws SQLException {
        String query = "SELECT * FROM Routes WHERE tripID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, tripID);
        ResultSet rs = ps.executeQuery();

        List<Route> routes = new ArrayList<>();
        while (rs.next()) {
            Route route = new Route(
                rs.getString("routeID"),
                rs.getString("startLocation"),
                rs.getString("destination"),
                rs.getDouble("cost")
                rs.getInt("travelTime")
            );
            routes.add(route);
        }
        return routes;
    }
}
