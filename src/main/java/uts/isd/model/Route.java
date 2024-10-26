package uts.isd.model;

import java.io.Serializable;

public class Route implements Serializable {
    private 
    private int routeID;
    private String startLocation;
    private String destination;
    private double cost;
    private int travelTime;

    // Constructor
    public Route(int routeID, String startLocation, String destination, double cost, int travelTime) {
        this.routeID = routeID;
        this.startLocation = startLocation;
        this.destination = destination;
        this.cost = cost;
        this.travelTime = travelTime;
    }

    // Getters and setters
    public int getRouteID() {
        return routeID;
    }

    public void setRouteID(int routeID) {
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

    public int getTravelTime() {
        return travelTime;
    }

    public void setTravelTime(int travelTime) {
        this.travelTime = travelTime;
    }
}
