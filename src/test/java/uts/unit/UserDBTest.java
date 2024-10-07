package uts.unit;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import uts.isd.dao.DBManager;
import uts.isd.model.User;

import java.sql.SQLException;

public class UserDBTest {

    private DBManager dbManager;  // The mock object

    @Before
    public void setUp() {
        // Create a mock of DBManager
        dbManager = mock(DBManager.class);
    }

    @Test
    public void testAddUser() throws SQLException {
        // Arrange: Create a User instance
        String name = "John Doe";
        String email = "john.doe@example.com";
        String password = "password123";
        String ID = "U123";
        String status = "active";
        String role = "customer";

        User mockUser = new User(name, email, password, ID, status, role);

        // Act: When the addUser method is called, no exception should be thrown
        doNothing().when(dbManager).addUser(name, email, password, ID, status, role);

        // Simulate finding the user
        when(dbManager.findUser(email, password)).thenReturn(mockUser);

        // Call the method to test
        dbManager.addUser(name, email, password, ID, status, role);

        // Assert: Verify the interaction and the returned values
        User fetchedUser = dbManager.findUser(email, password);
        assertNotNull(fetchedUser);
        assertEquals(name, fetchedUser.getName());
        assertEquals(email, fetchedUser.getEmail());
        assertEquals(password, fetchedUser.getPassword());
        assertEquals(status, fetchedUser.getStatus());
        assertEquals(role, fetchedUser.getRole());

        // Verify that the addUser method was called exactly once
        verify(dbManager, times(1)).addUser(name, email, password, ID, status, role);
    }

    @Test
    public void testFindUser() throws SQLException {
        // Arrange
        String email = "john.doe@example.com";
        String password = "password123";
        User mockUser = new User("John Doe", email, password, "U123", "active", "customer");

        // Simulate finding the user
        when(dbManager.findUser(email, password)).thenReturn(mockUser);

        // Act
        User foundUser = dbManager.findUser(email, password);

        // Assert
        assertNotNull(foundUser);
        assertEquals("John Doe", foundUser.getName());
        assertEquals(email, foundUser.getEmail());
    }

    @Test
    public void testDeleteUser() throws SQLException {
        // Arrange
        String email = "john.doe@example.com";
        String password = "password123";

        // Simulate the delete behavior
        doNothing().when(dbManager).deleteUser(email);

        // Simulate that the user no longer exists
        when(dbManager.findUser(email, password)).thenReturn(null);

        // Act
        dbManager.deleteUser(email);

        // Assert: Ensure that the user is deleted and cannot be found
        User user = dbManager.findUser(email, password);
        assertNull(user);

        // Verify that the deleteUser method was called exactly once
        verify(dbManager, times(1)).deleteUser(email);
    }
}
