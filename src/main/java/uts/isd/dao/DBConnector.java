package uts.isd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
    private Connection conn;
    private String driver = "com.mysql.cj.jdbc.Driver"; // Adjust driver as needed
    private String URL = "jdbc:mysql://localhost:3306/opaldb"; // Update with your DB URL
    private String dbuser = "root"; // Update with your DB username
    private String dbpass = "password"; // Update with your DB password

    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        conn = DriverManager.getConnection(URL, dbuser, dbpass);
    }

    public Connection openConnection() {
        return this.conn;
    }

    public void closeConnection() throws SQLException {
        if (this.conn != null) {
            this.conn.close();
        }
    }
}
