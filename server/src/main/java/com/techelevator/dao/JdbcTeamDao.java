package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Team;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Component
public class JdbcTeamDao implements TeamDao{

    private final JdbcTemplate jdbcTemplate;
    private static final RowMapper<Team> MAPPER = new RowMapper<Team>() {
        @Override
        public Team mapRow(ResultSet resultSet, int i) throws SQLException {
            int teamId = resultSet.getInt("team_id");
            String teamName = resultSet.getString("team_name");
            int sportId = resultSet.getInt("sport_id");
            Team team = new Team (teamId, teamName, sportId);
            return team;
        }
    };
    public JdbcTeamDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }



    @Override
    public List<Team> getTeams() {
        return jdbcTemplate.query("SELECT * FROM team", MAPPER);
    }

    @Override
    public Team getTeamById(int teamId) {
        List<Team> teams = jdbcTemplate.query("SELECT * FROM team WHERE team_id = ?", MAPPER, teamId);
        return teams.isEmpty() ? null : teams.get(0);
    }

    @Override
    public List<Team> getTeamsByName(String teamName) {
        return jdbcTemplate.query("SELECT * FROM team WHERE team_name ILIKE ?", MAPPER, "%" + teamName + "%");

    }
}
