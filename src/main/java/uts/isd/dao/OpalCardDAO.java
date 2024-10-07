package uts.isd.dao;

import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.OpalCard;

public class OpalCardDAO {
    private Connection conn;

    public OpalCardDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to add a new Opal card
    public void addOpalCard(OpalCard card) throws SQLException {
        String query = "INSERT INTO opalcard (cardNumber, cardName, balance, cardStatus, userID, cardSecurityCode) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, card.getCardNumber());
            stmt.setString(2, card.getCardName());
            stmt.setDouble(3, card.getBalance());
            stmt.setString(4, card.getCardStatus());
            stmt.setString(5, card.getUserID());
            stmt.setString(6, card.getCardSecurityCode());
            stmt.executeUpdate();
        }
    }

    // Method to get all cards for a specific user account
    public ArrayList<OpalCard> getCardsByUserId(String userId) throws SQLException {
        ArrayList<OpalCard> cards = new ArrayList<>();
        String query = "SELECT * FROM opalcard WHERE userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userId); // userID is a String
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OpalCard card = new OpalCard(
                        rs.getInt("cardID"),
                        rs.getString("cardNumber"),
                        rs.getString("cardName"),
                        rs.getDouble("balance"),
                        rs.getString("cardStatus"),
                        rs.getString("userID"),
                        rs.getString("cardSecurityCode"));
                cards.add(card);
            }
        }
        return cards;
    }

    // Method to delete an Opal card by cardId
    public void deleteOpalCard(int cardId) throws SQLException {
        String query = "DELETE FROM opalcard WHERE cardID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, cardId);
            stmt.executeUpdate();
        }
    }

    // Method to update the card nickname
    public void updateOpalCardName(int cardId, String newCardName) throws SQLException {
        String query = "UPDATE opalcard SET cardName = ? WHERE cardID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newCardName);
            stmt.setInt(2, cardId);
            stmt.executeUpdate();
        }
    }

    // Method to update balance of an Opal Card 
    public void topUpBalance(String cardNumber, double topUpAmount) throws SQLException {
        String query = "UPDATE opalcard SET balance = balance + ? WHERE cardNumber = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setDouble(1, topUpAmount);
            stmt.setString(2, cardNumber);
            stmt.executeUpdate();
        }
    }

    // Method to get the balance of an Opal Card
    public double getBalance(String cardNumber) throws SQLException {
        String query = "SELECT balance FROM opalcard WHERE cardNumber = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, cardNumber);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("balance");
            }
        }
        return 0.0;
    }
}
