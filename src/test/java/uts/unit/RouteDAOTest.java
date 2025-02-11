package uts.unit;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import uts.isd.dao.RouteDAO;
import uts.isd.model.Route;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RouteDAOTest {

    private Connection mockConn;
    private PreparedStatement mockStmt;
    private ResultSet mockRs;
    private RouteDAO routeDAO;

    @Before
    public void setUp() throws SQLException {
        mockConn = Mockito.mock(Connection.class);
        mockStmt = Mockito.mock(PreparedStatement.class);
        mockRs = Mockito.mock(ResultSet.class);
        routeDAO = new RouteDAO(mockConn);
    }

    @Test
    public void testGetAllRoutes() throws SQLException {
        when(mockConn.prepareStatement("SELECT * FROM Routes")).thenReturn(mockStmt);
        when(mockStmt.executeQuery()).thenReturn(mockRs);

        // Mocking ResultSet behavior
        when(mockRs.next()).thenReturn(true, true, false); // Two routes in result set
        when(mockRs.getInt("routeID")).thenReturn(1, 2);
        when(mockRs.getString("startLocation")).thenReturn("A", "B");
        when(mockRs.getString("destination")).thenReturn("B", "C");
        when(mockRs.getDouble("cost")).thenReturn(5.0, 10.0);
        when(mockRs.getInt("travelTime")).thenReturn(15, 30);

        List<Route> routes = routeDAO.getAllRoutes();

        assertEquals(2, routes.size());
        assertEquals("A", routes.get(0).getStartLocation());
        assertEquals("B", routes.get(1).getStartLocation());
    }

    @Test
    public void testGetRouteById() throws SQLException {
        when(mockConn.prepareStatement("SELECT * FROM Routes WHERE routeID = ?")).thenReturn(mockStmt);
        when(mockStmt.executeQuery()).thenReturn(mockRs);
        
        when(mockRs.next()).thenReturn(true);
        when(mockRs.getInt("routeID")).thenReturn(1);
        when(mockRs.getString("startLocation")).thenReturn("A");
        when(mockRs.getString("destination")).thenReturn("B");
        when(mockRs.getDouble("cost")).thenReturn(5.0);
        when(mockRs.getInt("travelTime")).thenReturn(15);

        Route route = routeDAO.getRouteById(1);

        assertNotNull(route);
        assertEquals(1, route.getRouteID());
        assertEquals("A", route.getStartLocation());
    }
}

