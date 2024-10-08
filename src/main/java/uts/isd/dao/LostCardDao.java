package uts.isd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LostCardDao {
    private Connection conn;

    // Constructor to receive the DBConnector and set the connection
    public LostCardDao(DBConnector dbConnector) {
        this.conn = dbConnector.openConnection();
    }

    // Method to report a lost or stolen card
    public void reportLostCard(String cardNumber, String reason) throws SQLException {
        String query = "INSERT INTO lost_cards (card_number, reason) VALUES (?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, cardNumber);
            stmt.setString(2, reason);
            stmt.executeUpdate();
        }
    }
}
