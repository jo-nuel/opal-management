package uts.isd.model;

import java.io.Serializable;

public class SavedTrip implements Serializable {
    private int savedTripID;
    private String savedTripName;
    private String startLocation;
    private String destination;
    private String userID;
    private String label;

    // Constructor
    public SavedTrip(int savedTripID, String savedTripName, String startLocation, String destination,
            String userID, String label) {
        this.savedTripID = savedTripID;
        this.savedTripName = savedTripName;
        this.startLocation = startLocation;
        this.destination = destination;
        this.userID = userID;
        this.label = label;
    }

    // Getters and setters
    public int getSavedTripID() {
        return savedTripID;
    }

    public void setSavedTripID(int savedTripID) {
        this.savedTripID = savedTripID;
    }

    public String getSavedTripName() {
        return savedTripName;
    }

    public void setSavedTripName(String savedTripName) {
        this.savedTripName = savedTripName;
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

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
