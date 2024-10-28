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
        tripDAO = new TripDAO(mockConn);
        routeDAO = new RouteDAO(mockConn);
    }

    @Test
    public void testSaveTrip() throws SQLException {
        Trip trip = new Trip(1, "Home to Office", "user123");
        Route route1 = new Route(1, "Home", "Station", 3.5, 15);
        Route route2 = new Route(2, "Station", "Office", 2.5, 10);
        trip.getRoutes().addAll(Arrays.asList(route1, route2));

        when(mockConn.prepareStatement("INSERT INTO Trips (tripID, tripName, userID) VALUES (?, ?, ?)"))
            .thenReturn(mockStmt);
        when(mockConn.prepareStatement("INSERT INTO Routes (routeID, tripID, startLocation, destination, cost, travelTime)"))
            .thenReturn(mockStmt);

        tripDAO.saveTrip(trip);

        verify(mockStmt, times(1)).executeUpdate();
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

        // Mocking RouteDAO behavior
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
