package uts.unit;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import uts.isd.dao.RouteDAO;
import uts.isd.dao.TripDAO;
import uts.isd.model.Route;
import uts.isd.model.Trip;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class TripDAOTest {

    private Connection mockConn;
    private PreparedStatement mockStmt;
    private ResultSet mockRs;
    private TripDAO tripDAO;
    private RouteDAO routeDAO;

    @Before
    public void setUp() throws SQLException {
        mockConn = Mockito.mock(Connection.class);
        mockStmt = Mockito.mock(PreparedStatement.class);
        mockRs = Mockito.mock(ResultSet.class);
        routeDAO = Mockito.mock(RouteDAO.class);
        tripDAO = new TripDAO(mockConn, routeDAO);
    }

    @Test
    public void testSaveTrip() throws SQLException {
        Trip trip = new Trip(1, "Home to Office", "user123");
        Route route1 = new Route(1, "Home", "Station", 3.5, 15);
        Route route2 = new Route(2, "Station", "Office", 2.5, 10);
        trip.getRoutes().addAll(Arrays.asList(route1, route2));
    
        // Ensure the mock PreparedStatement is returned
        when(mockConn.prepareStatement("INSERT INTO Trips (tripID, tripName, userID, routeIDs) VALUES (?, ?, ?, ?)"))
            .thenReturn(mockStmt);
        
        // Execute saveTrip on the DAO
        tripDAO.saveTrip(trip);
    
        // Verify that parameters are set and executeUpdate is called
        verify(mockStmt).setInt(1, trip.getTripID());
        verify(mockStmt).setString(2, trip.getTripName());
        verify(mockStmt).setString(3, trip.getUserID());
        verify(mockStmt).setString(4, "1,2"); // Ensuring routeIDs are set correctly
        verify(mockStmt).executeUpdate();
    }

    @Test
    public void testGetTripsByUser() throws SQLException {
        when(mockConn.prepareStatement("SELECT * FROM Trips WHERE userID = ?")).thenReturn(mockStmt);
    when(mockStmt.executeQuery()).thenReturn(mockRs);

    // Mocking Trips ResultSet behavior
    when(mockRs.next()).thenReturn(true, false);
    when(mockRs.getInt("tripID")).thenReturn(1);
    when(mockRs.getString("tripName")).thenReturn("Home to Office");
    when(mockRs.getString("routeIDs")).thenReturn("1,2");

    // Mocking RouteDAO behavior for getRouteById
    Route route1 = new Route(1, "Home", "Station", 3.5, 15);
    Route route2 = new Route(2, "Station", "Office", 2.5, 10);
    when(routeDAO.getRouteById(1)).thenReturn(route1);
    when(routeDAO.getRouteById(2)).thenReturn(route2);

    List<Trip> trips = tripDAO.getTripsByUser("user123");

    assertEquals(1, trips.size());
    Trip trip = trips.get(0);
    assertEquals("Home to Office", trip.getTripName());
    assertEquals(2, trip.getRoutes().size());
    assertEquals("Home", trip.getRoutes().get(0).getStartLocation());
    }
}
