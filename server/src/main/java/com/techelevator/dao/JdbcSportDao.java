package com.techelevator.dao;

import com.techelevator.model.Sport;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Component
public class JdbcSportDao implements SportDao{
    private final JdbcTemplate jdbcTemplate;

    private static final RowMapper<Sport> MAPPER = new RowMapper<Sport>() {
        @Override
        public Sport mapRow(ResultSet resultSet, int i) throws SQLException {
            int sportId = resultSet.getInt("sport_id");
            String sportName = resultSet.getString("sport_name");
            Sport sport = new Sport(sportId, sportName);
            return sport;
        }
    };
    public JdbcSportDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Sport> getSports() {
        return jdbcTemplate.query("SELECT * FROM sport", MAPPER);
    }

    @Override
    public Sport getSportById(int sportId) {
        List<Sport> sports = jdbcTemplate.query("SELECT * FROM sport WHERE sport_id = ?", MAPPER, sportId);
        return sports.isEmpty() ? null : sports.get(0);
    }

    @Override
    public List<Sport> getSportsByName(String sportName) {
        return jdbcTemplate.query("SELECT * FROM sport WHERE sport_name ILIKE ?", MAPPER, "%" + sportName + "%");
    }
}
