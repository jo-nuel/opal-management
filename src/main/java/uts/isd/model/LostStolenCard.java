package uts.isd.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class LostStolenCard implements Serializable {

    private int reportID;
    private int cardID;
    private String userID;
    private String reportType; // LOST or STOLEN
    private Timestamp reportDate;

    public LostStolenCard(int reportID, int cardID, String userID, String reportType, Timestamp reportDate) {
        this.reportID = reportID;
        this.cardID = cardID;
        this.userID = userID;
        this.reportType = reportType;
        this.reportDate = reportDate;
    }

    // Getters and Setters
    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public Timestamp getReportDate() {
        return reportDate;
    }

    public void setReportDate(Timestamp reportDate) {
        this.reportDate = reportDate;
    }
}
