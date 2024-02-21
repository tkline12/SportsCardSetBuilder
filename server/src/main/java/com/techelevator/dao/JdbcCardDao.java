package com.techelevator.dao;

import com.techelevator.model.Card;
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
    private static final RowMapper<Card> MAPPER = new RowMapper<Card>() {
        @Override
        public Card mapRow(ResultSet resultSet, int i) throws SQLException {
            int cardID = resultSet.getInt("card_id");
            String cardName = resultSet.getString("card_name");
            String cardNumber = resultSet.getString("card_number");
            int setID = resultSet.getInt("set_id");
            Card card = new Card(cardID, cardName, cardNumber, setID);
            return card;
        }
    };

    public JdbcCardDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Card> getCards() {
        return jdbcTemplate.query("SELECT * FROM card", MAPPER);
    }

    @Override
    public Card getCardByCardId(int cardID) {
        List<Card> cards = jdbcTemplate.query("SELECT * FROM card WHERE card_id = ?", MAPPER, cardID);
        return cards.isEmpty() ? null : cards.get(0);
    }

    @Override
    public List<Card> getCardsByPlayerId(int playerID) {
        return jdbcTemplate.query("SELECT * FROM card WHERE player_id = ?", MAPPER, playerID);
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
    public List<Card> getCardsByTeamId(int teamID) {
        return jdbcTemplate.query("SELECT * FROM card WHERE team_id = ?", MAPPER, teamID);
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
    public List<Card> getCardsBySetId(int setID) {
        return jdbcTemplate.query("SELECT * FROM card WHERE set_id = ?", MAPPER, setID);
    }
    //TODO: JOIN TABLES
    @Override
    public List<Card> getCardsBySetName(String setName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN set s ON s.set_id = c.set_id " +
                "WHERE set_name ILIKE ?", MAPPER, "%" + setName + "%");
    }

    @Override
    public List<Card> getCardsBySportId(int sportID) {
        return jdbcTemplate.query("SELECT * FROM card WHERE sport_id = ?", MAPPER, sportID);
    }
    //TODO: JOIN TABLES
    @Override
    public List<Card> getCardsBySportName(String sportName) {
        return jdbcTemplate.query("SELECT * FROM card c " +
                "JOIN sport s ON s.sport_id = c.sport_id " +
                "WHERE sport_name ILIKE ?", MAPPER,"%" + sportName + "%");
    }

    @Override
    public List<Card> getCardsByUserId(int userID) {
        return jdbcTemplate.query("SELECT * FROM card WHERE user_id = ?", MAPPER, userID);
    }
}
