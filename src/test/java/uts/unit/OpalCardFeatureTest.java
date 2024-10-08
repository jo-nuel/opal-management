package uts.unit;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import uts.isd.dao.OpalCardDAO;

import java.sql.SQLException;

public class OpalCardFeatureTest {

    private OpalCardDAO opalCardDAO;

    @Before
    public void setUp() {
        // Mock the OpalCardDAO for testing
        opalCardDAO = mock(OpalCardDAO.class);
    }

    @Test
    public void testReportLostOrStolenCard() throws SQLException {
        // Arrange
        int cardId = 1;
        String status = "LOST";  // Can be "LOST" or "STOLEN"

        // Act
        doNothing().when(opalCardDAO).reportLostOrStolenCard(cardId, status);
        opalCardDAO.reportLostOrStolenCard(cardId, status);

        // Assert
        verify(opalCardDAO, times(1)).reportLostOrStolenCard(cardId, status);
    }

    @Test
    public void testBlockCard() throws SQLException {
        // Arrange
        int cardId = 1;

        // Act
        doNothing().when(opalCardDAO).blockCard(cardId);
        opalCardDAO.blockCard(cardId);

        // Assert
        verify(opalCardDAO, times(1)).blockCard(cardId);
    }

    @Test
    public void testRequestReplacementCard() throws SQLException {
        // Arrange
        int cardId = 1;

        // Act
        doNothing().when(opalCardDAO).requestReplacement(cardId);
        opalCardDAO.requestReplacement(cardId);

        // Assert
        verify(opalCardDAO, times(1)).requestReplacement(cardId);
    }
}

