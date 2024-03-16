package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Player;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Component
public class JdbcCardDao implements CardDao{
    private final JdbcTemplate jdbcTemplate;
    private final RowMapper<Card> MAPPER = new RowMapper<Card>() {
        @Override
        public Card mapRow(ResultSet resultSet, int i) throws SQLException {
            int cardId = resultSet.getInt("card_id");
            String cardName = resultSet.getString("card_name");
            String cardNumber = resultSet.getString("card_number");
            int setId = resultSet.getInt("set_id");
            List<Player> players = playerDao.getPlayersByCardId(cardId);
            String image = resultSet.getString("image");
            String setName = cardSetDao.getSetBySetId(setId).getSetName();
            boolean isOwned = resultSet.getBoolean("is_owned");
            Card card = new Card(cardId, cardName, cardNumber, players, image, setId, setName, isOwned);
            return card;
        }
    };

    private final PlayerDao playerDao;
    private final CardSetDao cardSetDao;

    public JdbcCardDao(DataSource dataSource, PlayerDao playerDao, CardSetDao cardSetDao) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.playerDao = playerDao;
        this.cardSetDao = cardSetDao;
    }

    @Override
    public List<Card> getCards() {
        return jdbcTemplate.query("SELECT * FROM card", MAPPER);
    }

    @Override
    public Card getCardByCardId(int cardId) {
        List<Card> cards = jdbcTemplate.query("SELECT * FROM card WHERE card_id = ?", MAPPER, cardId);
        return cards.isEmpty() ? null : cards.get(0);
    }

    @Override
    public List<Card> getCardsByPlayerId(int playerId) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN player_card pc ON pc.card_id = c.card_id " +
                "WHERE pc.player_id = ?", MAPPER, playerId);
    }
    //TODO: JOIN TABLES
    @Override
    public List<Card> getCardsByPlayerName(String playerName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN player_card pc ON pc.player_id = c.player_id " +
                "JOIN player p ON p.player_id = pc.player_id " +
                "WHERE player_name ILIKE ?", MAPPER, "%" + playerName + "%");
    }

    @Override
    public List<Card> getCardsByTeamId(int teamId) {
        return jdbcTemplate.query("SELECT * FROM card WHERE team_id = ?", MAPPER, teamId);
    }
    //TODO: JOIN TABLES
    @Override
    public List<Card> getCardsByTeamName(String teamName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN team_card tc ON tc.team_id = c.team_id " +
                "JOIN team t ON t.team_id = tc.team_id " +
                "WHERE team_name ILIKE ?", MAPPER,"%" + teamName + "%");
    }

    @Override
    public List<Card> getCardsBySetId(int setId) {
        return jdbcTemplate.query("SELECT * FROM card WHERE set_id = ? ORDER BY" +
                " CASE " +
                " WHEN card_number ~ '^[0-9]+$' THEN card_number::numeric" +
                " ELSE NULL" +
                " END ASC NULLS LAST," +
                " card_number ASC;", MAPPER, setId);
    }
    //TODO: JOIN TABLES
    @Override
    public List<Card> getCardsBySetName(String setName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN set s ON s.set_id = c.set_id " +
                "WHERE set_name ILIKE ?", MAPPER, "%" + setName + "%");
    }

    @Override
    public List<Card> getCardsBySportId(int sportId) {
        return jdbcTemplate.query("SELECT * FROM card WHERE sport_id = ?", MAPPER, sportId);
    }
    //TODO: JOIN TABLES
    @Override
    public List<Card> getCardsBySportName(String sportName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN sport s ON s.sport_id = c.sport_id " +
                "WHERE sport_name ILIKE ?", MAPPER,"%" + sportName + "%");
    }

    @Override
    public List<Card> getCardsByUserId(int userId) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN user_card uc ON uc.card_id = c.card_id " +
                "WHERE uc.user_id = ?", MAPPER, userId);
    }
}
