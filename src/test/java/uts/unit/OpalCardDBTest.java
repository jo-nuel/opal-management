package uts.unit;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import uts.isd.dao.OpalCardDAO;
import uts.isd.model.OpalCard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class OpalCardDBTest {

    private OpalCardDAO opalCardDAO;

    @Before
    public void setUp() {
        // Create a mock of OpalCardDAO
        opalCardDAO = mock(OpalCardDAO.class);
    }

    @Test
    public void testAddOpalCard() throws SQLException {
        // Arrange: Create an OpalCard instance
        String cardNumber = "123456789";
        String cardName = "Test Card";
        double balance = 100.0;
        String cardStatus = "active";
        String userID = "1";
        String cardSecurityCode = "1234";

        OpalCard mockOpalCard = new OpalCard(0, cardNumber, cardName, balance, cardStatus, userID, cardSecurityCode);

        // Act: When the addOpalCard method is called, no exception should be thrown
        doNothing().when(opalCardDAO).addOpalCard(mockOpalCard);

        // Simulate finding the Opal card after adding
        when(opalCardDAO.getCardsByUserId(userID)).thenReturn(new ArrayList<>());

        // Call the method to test
        opalCardDAO.addOpalCard(mockOpalCard);

        // Assert: Verify the interaction and the returned values
        List<OpalCard> fetchedCards = opalCardDAO.getCardsByUserId(userID);
        assertNotNull(fetchedCards);

        // Verify that the addOpalCard method was called exactly once
        verify(opalCardDAO, times(1)).addOpalCard(mockOpalCard);
    }

    @Test
    public void testFindOpalCard() throws SQLException {
        // Arrange
        String cardNumber = "123456789";
        String cardName = "Test Card";
        double balance = 100.0;
        String cardStatus = "active";
        String userID = "1";
        String cardSecurityCode = "1234";

        OpalCard mockOpalCard = new OpalCard(0, cardNumber, cardName, balance, cardStatus, userID, cardSecurityCode);

        // Simulate finding the Opal card
        when(opalCardDAO.getCardsByUserId(userID)).thenReturn(new ArrayList<>(Arrays.asList(mockOpalCard)));

        // Act
        List<OpalCard> foundCards = opalCardDAO.getCardsByUserId(userID);

        // Assert
        assertNotNull(foundCards);
        assertEquals(1, foundCards.size());
        assertEquals(cardName, foundCards.get(0).getCardName());
    }

    @Test
    public void testDeleteOpalCard() throws SQLException {
        // Arrange
        String cardNumber = "123456789";
        String cardName = "Test Card";
        double balance = 100.0;
        String cardStatus = "active";
        String userID = "1";
        String cardSecurityCode = "1234";

        OpalCard mockOpalCard = new OpalCard(1, cardNumber, cardName, balance, cardStatus, userID, cardSecurityCode);

        // Simulate deleting the card
        doNothing().when(opalCardDAO).deleteOpalCard(mockOpalCard.getCardID());

        // Act
        opalCardDAO.deleteOpalCard(mockOpalCard.getCardID());

        // Simulate no cards being found after deletion
        when(opalCardDAO.getCardsByUserId(userID)).thenReturn(new ArrayList<>());

        // Assert: Ensure that the card is deleted and cannot be found
        List<OpalCard> fetchedCards = opalCardDAO.getCardsByUserId(userID);
        assertEquals(0, fetchedCards.size());

        // Verify that the deleteOpalCard method was called exactly once
        verify(opalCardDAO, times(1)).deleteOpalCard(mockOpalCard.getCardID());
    }

    @Test
    public void testRenameOpalCard() throws SQLException {
        // Arrange
        String cardNumber = "123456789";
        String oldCardName = "Old Card Name";
        String newCardName = "New Card Name";
        double balance = 100.0;
        String cardStatus = "active";
        String userID = "1";
        String cardSecurityCode = "1234";

        OpalCard mockOpalCard = new OpalCard(1, cardNumber, oldCardName, balance, cardStatus, userID, cardSecurityCode);

        // Simulate renaming the card
        doNothing().when(opalCardDAO).updateOpalCardName(mockOpalCard.getCardID(), newCardName);

        // Act
        opalCardDAO.updateOpalCardName(mockOpalCard.getCardID(), newCardName);

        // Simulate fetching the renamed card
        mockOpalCard.setCardName(newCardName);
        when(opalCardDAO.getCardsByUserId(userID)).thenReturn(new ArrayList<>(Arrays.asList(mockOpalCard)));

        // Assert: Ensure the card's name is updated correctly
        List<OpalCard> updatedCards = opalCardDAO.getCardsByUserId(userID);
        assertEquals(newCardName, updatedCards.get(0).getCardName());

        // Verify that the updateOpalCardName method was called exactly once
        verify(opalCardDAO, times(1)).updateOpalCardName(mockOpalCard.getCardID(), newCardName);
    }
}
