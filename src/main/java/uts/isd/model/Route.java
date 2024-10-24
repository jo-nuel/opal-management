package uts.isd.model;

import java.io.Serializable;

public class Route implements Serializable {
    private String routeID;
    private String startLocation;
    private String destination;
    private double cost;

    // Constructor
    public Route(String routeID, String startLocation, String destination, double cost) {
        this.routeID = routeID;
        this.startLocation = startLocation;
        this.destination = destination;
        this.cost = cost;
    }

    // Getters and setters
    public String getRouteID() {
        return routeID;
    }

    public void setRouteID(String routeID) {
        this.routeID = routeID;
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

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }
}
