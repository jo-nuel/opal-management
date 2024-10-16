package uts.unit;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.junit.Before;
import org.junit.Test;
import uts.isd.dao.ContactDAO;

public class ContactDAOTest {

    private ContactDAO contactDAO;  
    private Connection mockConn;  
    private PreparedStatement mockStmt;

    @Before
    public void setUp() throws SQLException {
        // Mocking the Connection and PreparedStatement
        mockConn = mock(Connection.class);
        mockStmt = mock(PreparedStatement.class);

        // When connection.prepareStatement is called, return the mock statement
        when(mockConn.prepareStatement(anyString())).thenReturn(mockStmt);

        // Instantiate the ContactDAO with the mock connection
        contactDAO = new ContactDAO(mockConn);
    }

    @Test
    public void testSaveContactSubmission() throws SQLException {
        // Act: Call the method to be tested
        contactDAO.saveContactSubmission("Jane Doe", "jane@example.com", "Test message");

        // Assert: Ensure the correct query was prepared and executed
        verify(mockStmt, times(1)).setString(1, "Jane Doe");
        verify(mockStmt, times(1)).setString(2, "jane@example.com");
        verify(mockStmt, times(1)).setString(3, "Test message");
        verify(mockStmt, times(1)).executeUpdate();
    }
}
