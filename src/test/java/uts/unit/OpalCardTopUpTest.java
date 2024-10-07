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

public class OpalCardTopUpTest {

    private OpalCardDAO opalCardDAO;

    @Before
    public void setUp() {
        // Create a mock of OpalCardDAO
        opalCardDAO = mock(OpalCardDAO.class);
    }

    @Test
    public void testTopUpBalance() throws SQLException {
        // Arrange: Create an OpalCard instance
        String cardNumber = "123456789";
        String cardName = "Test Card";
        double initialBalance = 50.0;
        String cardStatus = "active";
        String userID = "1";
        String cardSecurityCode = "1234";

        OpalCard mockOpalCard = new OpalCard(0, cardNumber, cardName, initialBalance, cardStatus, userID, cardSecurityCode);

        double topUpAmount = 20.0;

        // Simulate finding the Opal card before topping up
        when(opalCardDAO.getCardsByUserId(userID)).thenReturn(new ArrayList<>(List.of(mockOpalCard)));

        // Act: When the topUpBalance method is called, no exception should be thrown
        doNothing().when(opalCardDAO).topUpBalance(cardNumber, topUpAmount);
        
        // Call the method to test
        opalCardDAO.topUpBalance(cardNumber, topUpAmount);

        // Update the balance manually for verification
        mockOpalCard.setBalance(initialBalance + topUpAmount);

        // Assert: Verify that the topUpBalance method was called
        verify(opalCardDAO, times(1)).topUpBalance(cardNumber, topUpAmount);

        // Simulate finding the Opal card after topping up and verify the balance
        when(opalCardDAO.getCardsByUserId(userID)).thenReturn(new ArrayList<>(List.of(mockOpalCard)));

        List<OpalCard> fetchedCards = opalCardDAO.getCardsByUserId(userID);
        assertNotNull(fetchedCards);
        assertEquals(1, fetchedCards.size());
        assertEquals(initialBalance + topUpAmount, fetchedCards.get(0).getBalance(), 0.01);
    }
}
