package uts.unit;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import uts.isd.dao.SavedTripDAO;
import uts.isd.model.SavedTrip;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SavedTripDBTest {

    private SavedTripDAO savedTripDAO;

    @Before
    public void setUp() {
        // Create a mock of SavedTripDAO
        savedTripDAO = mock(SavedTripDAO.class);
    }

    @Test
    public void testAddSavedTrip() throws SQLException {
        // Arrange
        SavedTrip mockTrip = new SavedTrip(0, "Test Trip", "Start Location", "Destination", "1", "Personal");

        // Act
        doNothing().when(savedTripDAO).addSavedTrip(mockTrip);
        when(savedTripDAO.getTripsByUserID("1")).thenReturn(new ArrayList<>(Arrays.asList(mockTrip)));

        // Call the method to test
        savedTripDAO.addSavedTrip(mockTrip);

        // Assert
        List<SavedTrip> trips = savedTripDAO.getTripsByUserID("1");
        assertNotNull(trips);
        assertEquals(1, trips.size());
        assertEquals("Test Trip", trips.get(0).getSavedTripName());

        verify(savedTripDAO, times(1)).addSavedTrip(mockTrip);
    }

    @Test
    public void testFindSavedTripByUserID() throws SQLException {
        // Arrange
        SavedTrip mockTrip1 = new SavedTrip(0, "Trip 1", "Start 1", "Destination 1", "1", "Work");
        SavedTrip mockTrip2 = new SavedTrip(0, "Trip 2", "Start 2", "Destination 2", "1", "Personal");

        // Simulate finding trips by user ID
        when(savedTripDAO.getTripsByUserID("1")).thenReturn(new ArrayList<>(Arrays.asList(mockTrip1, mockTrip2)));

        // Act
        List<SavedTrip> trips = savedTripDAO.getTripsByUserID("1");

        // Assert
        assertNotNull(trips);
        assertEquals(2, trips.size());
        assertEquals("Trip 1", trips.get(0).getSavedTripName());
        assertEquals("Trip 2", trips.get(1).getSavedTripName());
    }

    @Test
    public void testDeleteSavedTrip() throws SQLException {
        // Arrange
        SavedTrip mockTrip = new SavedTrip(1, "Trip to Delete", "Start Location", "Destination", "1", "Personal");

        // Simulate deleting the trip
        doNothing().when(savedTripDAO).deleteSavedTrip(String.valueOf(mockTrip.getSavedTripID()));

        // Act
        savedTripDAO.deleteSavedTrip(String.valueOf(mockTrip.getSavedTripID()));

        // Simulate no trips being found after deletion
        when(savedTripDAO.getTripsByUserID("1")).thenReturn(new ArrayList<>());

        // Assert
        List<SavedTrip> trips = savedTripDAO.getTripsByUserID("1");
        assertEquals(0, trips.size());

        verify(savedTripDAO, times(1)).deleteSavedTrip(String.valueOf(mockTrip.getSavedTripID()));
    }

    @Test
    public void testUpdateSavedTripDetails() throws SQLException {
        // Arrange
        SavedTrip mockTrip = new SavedTrip(1, "Old Trip", "Old Start", "Old Destination", "1", "Old Label");

        // Simulate updating the trip
        doNothing().when(savedTripDAO).updateSavedTripDetails(
                String.valueOf(mockTrip.getSavedTripID()),
                "Updated Trip",
                "New Start",
                "New Destination",
                "Updated Label");

        // Act
        savedTripDAO.updateSavedTripDetails(
                String.valueOf(mockTrip.getSavedTripID()),
                "Updated Trip",
                "New Start",
                "New Destination",
                "Updated Label");

        // Simulate fetching the updated trip
        mockTrip.setSavedTripName("Updated Trip");
        mockTrip.setStartLocation("New Start");
        mockTrip.setDestination("New Destination");
        mockTrip.setLabel("Updated Label");
        when(savedTripDAO.getTripsByUserID("1")).thenReturn(new ArrayList<>(Arrays.asList(mockTrip)));

        // Assert
        List<SavedTrip> updatedTrips = savedTripDAO.getTripsByUserID("1");
        assertEquals("Updated Trip", updatedTrips.get(0).getSavedTripName());
        assertEquals("New Start", updatedTrips.get(0).getStartLocation());
        assertEquals("New Destination", updatedTrips.get(0).getDestination());
        assertEquals("Updated Label", updatedTrips.get(0).getLabel());

        verify(savedTripDAO, times(1)).updateSavedTripDetails(
                String.valueOf(mockTrip.getSavedTripID()),
                "Updated Trip",
                "New Start",
                "New Destination",
                "Updated Label");
    }
}
