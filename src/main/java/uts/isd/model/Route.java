package uts.isd.model;

import java.io.Serializable;

public class Trip implements Serializable {
    private String tripID;
    private String tripName;
    private String startLocation;
    private String destination;
    private String routeDetails; // Details about the route
    private double fare; // Itemized cost of the trip
    private String userID; // Links the trip to the user

    public Trip(String tripID, String tripName, String startLocation, String destination, String routeDetails, double fare, String userID) {
        this.tripID = tripID;
        this.tripName = tripName;
        this.startLocation = startLocation;
        this.destination = destination;
        this.routeDetails = routeDetails;
        this.fare = fare;
        this.userID = userID;
    }

    public String getTripID() {
        return tripID;
    }

    public void setTripID(String tripID) {
        this.tripID = tripID;
    }

    public String getTripName() {
        return tripName;
    }

    public void setTripName(String tripName) {
        this.tripName = tripName;
    }

    public String getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(String startLocation) {
        this.startLocation = startLocation;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getRouteDetails() {
        return routeDetails;
    }

    public void setRouteDetails(String routeDetails) {
        this.routeDetails = routeDetails;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
}
