package uts.isd.model;

import java.io.Serializable;

public class OpalCard implements Serializable {

    private int cardID;
    private String cardNumber;
    private String cardName;
    private double balance;
    private String cardStatus;
    private String userID;
    private String cardSecurityCode;

    // Constructor
    public OpalCard(int cardID, String cardNumber, String cardName, double balance, String cardStatus, String userID,
            String cardSecurityCode) {
        this.cardID = cardID;
        this.cardNumber = cardNumber;
        this.cardName = cardName;
        this.balance = balance;
        this.cardStatus = cardStatus;
        this.userID = userID;
        this.cardSecurityCode = cardSecurityCode;
    }

    // Getters
    public int getCardID() {
        return cardID;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCardName() {
        return cardName;
    }

    public double getBalance() {
        return balance;
    }

    public String getCardStatus() {
        return cardStatus;
    }

    public String getUserID() {
        return userID;
    }

    public String getCardSecurityCode() {
        return cardSecurityCode;
    }

    // Setters
    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public void setCardStatus(String cardStatus) {
        this.cardStatus = cardStatus;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setCardSecurityCode(String cardSecurityCode) {
        this.cardSecurityCode = cardSecurityCode;
    }
}
