package uts.isd.dao;

import uts.isd.model.Route;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RouteDAO {
    private Connection conn;

    public RouteDAO(Connection conn) {
        this.conn = conn;
    }

    // Retrieve all routes
    public List<Route> getAllRoutes() throws SQLException {
        String query = "SELECT * FROM Routes";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        List<Route> routes = new ArrayList<>();
        while (rs.next()) {
            Route route = new Route(
                rs.getInt("routeID"),
                rs.getString("startLocation"),
                rs.getString("destination"),
                rs.getDouble("cost"),
                rs.getInt("travelTime")
            );
            routes.add(route);
        }
        return routes;
    }

    public Route getRouteById(int routeID) throws SQLException {
        String query = "SELECT * FROM Routes WHERE routeID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, routeID);
        ResultSet rs = ps.executeQuery();
    
        if (rs.next()) {
            return new Route(
                rs.getInt("routeID"),
                rs.getString("startLocation"),
                rs.getString("destination"),
                rs.getDouble("cost"),
                rs.getInt("travelTime")
            );
        }
        return null; 
    }
}
