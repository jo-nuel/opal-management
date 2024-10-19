package uts.isd.controller;

import uts.isd.dao.DBManager;
import uts.isd.model.Event;
import uts.isd.model.User;


import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class EventControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        DBManager dbManager = (DBManager) session.getAttribute("manager");  // Get DBManager from session

        if (action == null) {
            action = "list";  // Default action is to list events
        }

        try {
            switch (action) {
                case "list":
                    listEvents(request, response, dbManager);
                    break;
                case "filter":
                    filterEvents(request, response, dbManager);
                    break;
                case "edit":
                    showEditForm(request, response, dbManager);
                    break;
                default:
                    listEvents(request, response, dbManager);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        DBManager dbManager = (DBManager) session.getAttribute("manager");  // Get DBManager from session

        if (action == null) {
            action = "list";  // Default action is to list events
        }

        try {
            switch (action) {
                case "add":
                    addEvent(request, response, dbManager);
                    break;
                case "update":
                    updateEvent(request, response, dbManager);
                    break;
                case "delete":  
                    deleteEvent(request, response, dbManager);
                    break;
                default:
                    listEvents(request, response, dbManager);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    private void filterEvents(HttpServletRequest request, HttpServletResponse response, DBManager dbManager) throws ServletException, IOException, SQLException {
        String filterId = request.getParameter("filterId");
        String filterCategory = request.getParameter("filterCategory");
        String filterDate = request.getParameter("filterDate");
        String filterLocation = request.getParameter("filterLocation");
    
        ArrayList<Event> filteredEvents = dbManager.filterEvents(filterId, filterCategory, filterDate, filterLocation);
    
        if (filteredEvents.isEmpty()) {
            request.setAttribute("errorMessage", "No events found matching the filter criteria.");
        }
    
        request.setAttribute("events", filteredEvents);
    
        // Check the user role and redirect accordingly
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");  // Get DBManager from session
        String role = currentUser.getRole();
        if ("admin".equals(role)) {
            // Redirect to admin events view
            request.getRequestDispatcher("adminEvents.jsp").forward(request, response);
        } else if ("user".equals(role)) {
            // Redirect to user events view
            request.getRequestDispatcher("userEventView.jsp").forward(request, response);
        } 
    }
    
    
    private void listEvents(HttpServletRequest request, HttpServletResponse response, DBManager dbManager) throws ServletException, IOException, SQLException {
        ArrayList<Event> events = dbManager.fetchEvents();  // Get all events from DB
        HttpSession session = request.getSession();
        session.setAttribute("events", events);

        request.getRequestDispatcher("adminEvents.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, DBManager dbManager) throws ServletException, IOException, SQLException {
        int eventId = Integer.parseInt(request.getParameter("id"));
        Event event = dbManager.getEventById(eventId);  // Get event by ID from DB
        request.setAttribute("event", event);
        request.getRequestDispatcher("editEventForm.jsp").forward(request, response);
    }

    private void addEvent(HttpServletRequest request, HttpServletResponse response, DBManager dbManager) throws IOException, SQLException, ServletException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String location = request.getParameter("location");

        // Parsing the date from the form input
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date eventDate = null;
        try {
            eventDate = dateFormat.parse(request.getParameter("date"));
        } catch (ParseException e) {


            throw new ServletException("Invalid date format");
        }

        Event newEvent = new Event(0, name, category, description, eventDate, location);  //  ID is auto-incremented in DB
        dbManager.addEvent(newEvent);  // Add the new event to the DB
        response.sendRedirect("EventControllerServlet?action=list");
    }

    private void updateEvent(HttpServletRequest request, HttpServletResponse response, DBManager dbManager) throws IOException, SQLException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String location = request.getParameter("location");

        // Parsing the date from the form input
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date eventDate = null;
        try {
            eventDate = dateFormat.parse(request.getParameter("date"));
        } catch (ParseException e) {
            throw new ServletException("Invalid date format");
        }

        Event event = new Event(id, name, category, description, eventDate, location);
        dbManager.updateEvent(event);  // Update event in DB
        response.sendRedirect("EventControllerServlet?action=list");
    }

    private void deleteEvent(HttpServletRequest request, HttpServletResponse response, DBManager dbManager) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        dbManager.deleteEvent(id);  // Delete event from DB
        response.sendRedirect("EventControllerServlet?action=list");
    }
}
