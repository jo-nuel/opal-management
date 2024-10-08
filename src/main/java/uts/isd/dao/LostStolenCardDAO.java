package uts.isd.dao;

import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.LostStolenCard;

public class LostStolenCardDAO {
    private Connection conn;

    public LostStolenCardDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to record a lost or stolen card
    public void reportLostOrStolenCard(int cardID, String userID, String reportType) throws SQLException {
        String query = "INSERT INTO lost_stolen_cards (cardID, userID, reportType, reportDate) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, cardID);
            stmt.setString(2, userID);
            stmt.setString(3, reportType);  // This will either be "LOST" or "STOLEN"
            stmt.executeUpdate();
        }
    }

    // Method to retrieve all lost or stolen cards by userID
    public ArrayList<LostStolenCard> getLostOrStolenCardsByUser(String userID) throws SQLException {
        ArrayList<LostStolenCard> reports = new ArrayList<>();
        String query = "SELECT * FROM lost_stolen_cards WHERE userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                LostStolenCard report = new LostStolenCard(
                        rs.getInt("reportID"),
                        rs.getInt("cardID"),
                        rs.getString("userID"),
                        rs.getString("reportType"),
                        rs.getTimestamp("reportDate")
                );
                reports.add(report);
            }
        }
        return reports;
    }
}
