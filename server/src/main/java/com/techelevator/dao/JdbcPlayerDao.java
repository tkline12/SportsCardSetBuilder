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
public class JdbcPlayerDao implements PlayerDao{
    private final JdbcTemplate jdbcTemplate;
    private static final RowMapper<Player> MAPPER = new RowMapper<Player>() {
        @Override
        public Player mapRow(ResultSet resultSet, int i) throws SQLException {
            int playerID = resultSet.getInt("player_id");
            String playerName = resultSet.getString("player_name");
            Player player = new Player(playerID, playerName);
            return player;
        }
    };
    public JdbcPlayerDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Player> getPlayers() {
        return jdbcTemplate.query("SELECT * FROM player", MAPPER);
    }

    @Override
    public Player getPlayerById(int playerID) {
        List<Player> players = jdbcTemplate.query("SELECT * FROM player WHERE player_id = ?", MAPPER, playerID);
        return players.isEmpty() ? null : players.get(0);
    }

    @Override
    public List<Player> getPlayersByPlayerName(String playerName) {
        return jdbcTemplate.query("SELECT * FROM player WHERE player_name ILIKE ?", MAPPER, "%" + playerName + "%");
    }

    @Override
    public List<Player> getPlayersByTeamId(int teamID) {
        return jdbcTemplate.query("SELECT * FROM player WHERE team_id = ?", MAPPER, teamID);
    }
    //TODO:JOIN TABLES

    @Override
    public List<Player> getPlayersByTeamName(String teamName) {
        return jdbcTemplate.query("SELECT * FROM player p " +
                "JOIN team t ON t.team_id = p.team_id WHERE team_name ILIKE ?", MAPPER, "%" + teamName + "%");
    }
    //TODO: JOIN TABLES

    public List<Player> getPlayersByCardId(int cardID) {
        return jdbcTemplate.query("select * from player p " +
                "JOIN player_card pc ON pc.player_id= p.player_id " +
                "WHERE pc.card_id = ?", MAPPER, cardID);
    }
}
