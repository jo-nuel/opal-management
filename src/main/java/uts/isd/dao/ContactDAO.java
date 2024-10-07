package uts.isd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactDAO {
    private Connection conn;

    public ContactDAO(Connection conn) {
        this.conn = conn;
    }

    public void saveContactSubmission(String name, String email, String message) throws SQLException {
        String query = "INSERT INTO contact_submissions (name, email, message) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);
            pstmt.executeUpdate();
        }
    }
}
