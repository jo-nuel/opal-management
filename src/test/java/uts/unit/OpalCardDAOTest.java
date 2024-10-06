package uts.unit;

import org.junit.*;
import static org.junit.Assert.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import uts.isd.dao.OpalCardDAO;
import uts.isd.model.OpalCard;

public class OpalCardDAOTest {

    private OpalCardDAO opalCardDAO;
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        // Set up a test connection using H2 in-memory database
        connection = DriverManager.getConnection("jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1", "sa", "");
        // Initialize schema for testing
        String createTableSQL = "CREATE TABLE opalcard (" +
                "cardID INT AUTO_INCREMENT PRIMARY KEY," +
                "cardNumber VARCHAR(20)," +
                "cardName VARCHAR(100)," +
                "balance DECIMAL(10, 2)," +
                "cardStatus VARCHAR(20)," +
                "userID VARCHAR(10)," +
                "cardSecurityCode VARCHAR(10));";
        connection.createStatement().execute(createTableSQL);

        opalCardDAO = new OpalCardDAO(connection);
    }

    @Test
    public void testAddOpalCard() throws SQLException {
        OpalCard card = new OpalCard(0, "123456789", "Test Card", 100.0, "active", "1", "1234");
        opalCardDAO.addOpalCard(card);

        List<OpalCard> cards = opalCardDAO.getCardsByUserId("1");
        assertNotNull(cards);
        assertEquals(1, cards.size());
        assertEquals("Test Card", cards.get(0).getCardName());
        assertEquals(100.0, cards.get(0).getBalance(), 0.01);
    }

    @Test
    public void testDeleteOpalCard() throws SQLException {
        // Add and then delete a card, verify it's removed
        OpalCard card = new OpalCard(0, "987654321", "Test Delete", 50.0, "active", "1", "1234");
        opalCardDAO.addOpalCard(card);

        List<OpalCard> cards = opalCardDAO.getCardsByUserId("1");
        assertEquals(1, cards.size());

        opalCardDAO.deleteOpalCard(cards.get(0).getCardID());
        cards = opalCardDAO.getCardsByUserId("1");
        assertEquals(0, cards.size());
    }

    @After
    public void tearDown() throws SQLException {
        connection.close(); // Close connection after testing
    }
}
