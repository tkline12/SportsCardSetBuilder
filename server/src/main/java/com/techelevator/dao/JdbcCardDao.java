package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Player;
import com.techelevator.model.UserCard;
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
            String cardNumber = resultSet.getString("card_number");
            int setId = resultSet.getInt("set_id");
            List<Player> players = playerDao.getPlayersByCardId(cardId);
            String image = resultSet.getString("image");
            String setName = cardSetDao.getSetBySetId(setId).getSetName();
            int subsetId = resultSet.getInt("subset_id");
            String subsetName = subsetDao.getSubsetById(subsetId).getSubsetName();
            Card card = new Card(cardId, cardNumber, players, image, setId, setName, subsetId, subsetName);
            return card;
        }
    };

    private final PlayerDao playerDao;
    private final CardSetDao cardSetDao;
    private final SubsetDao subsetDao;

    public JdbcCardDao(DataSource dataSource, PlayerDao playerDao, CardSetDao cardSetDao, SubsetDao subsetDao) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.playerDao = playerDao;
        this.cardSetDao = cardSetDao;
        this.subsetDao = subsetDao;
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

    @Override
    public List<Card> getCardsBySubsetId(int subsetId) {
        return null;
    }

    public List<Card> getCardsBySubsetName(String subsetName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN subset s ON s.subset_id = c.subset_id " +
                "WHERE subset_name ILIKE ?", MAPPER,"%" + subsetName + "%");
    }
    public UserCard addCardToUserCard(int cardId, int userId){
        jdbcTemplate.update("INSERT INTO user_card (user_id, card_id) VALUES (?, ?)", userId, cardId);
        return null;
    }
    public UserCard deleteCardFromUserCard(int cardId, int userId){
        jdbcTemplate.update("DELETE FROM user_card WHERE user_id = ? AND card_id = ?", userId, cardId);
        return null;
    }
}
