package uts.isd.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Trip implements Serializable {
    private int tripID;
    private String tripName; // Name for the saved trip (e.g., "Home to Office")
    private String userID; // Links the trip to a user
    private List<Route> routes; // List of routes for the trip

    // Constructor
    public Trip(int tripID, String tripName, String userID) {
        this.tripID = tripID;
        this.tripName = tripName;
        this.userID = userID;
        this.routes = new ArrayList<>();
    }

    // Add a route to the trip
    public void addRoute(Route route) {
        this.routes.add(route);
    }

    // Getters and setters
    public int getTripID() {
        return tripID;
    }

    public void setTripID(int tripID) {
        this.tripID = tripID;
    }

    public String getTripName() {
        return tripName;
    }

    public void setTripName(String tripName) {
        this.tripName = tripName;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public List<Route> getRoutes() {
        return routes;
    }
