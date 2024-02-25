package com.techelevator.dao;

import com.techelevator.model.CardSet;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Component
public class JdbcCardSetDao implements CardSetDao{
    private final JdbcTemplate jdbcTemplate;

    private static final RowMapper<CardSet> MAPPER = new RowMapper<CardSet>() {
        @Override
        public CardSet mapRow(ResultSet resultSet, int i) throws SQLException {
            int setID = resultSet.getInt("set_id");
            String setName = resultSet.getString("set_name");
            String setYear = resultSet.getString("Year");
            String setBrand = resultSet.getString("Brand");
            String setImage = resultSet.getString("set_image");
            CardSet cardSet = new CardSet(setID, setName, setYear, setBrand, setImage);
            return cardSet;
        }
    };

    public JdbcCardSetDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<CardSet> getSets() {
        return jdbcTemplate.query("SELECT * FROM set", MAPPER);
    }

    @Override
    public CardSet getSetBySetId(int setID) {
        List<CardSet> sets = jdbcTemplate.query("SELECT * FROM set WHERE set_id = ?", MAPPER, setID);
        return sets.isEmpty() ? null : sets.get(0);
    }

    @Override
    public List<CardSet> getSetsBySetName(String setName) {
        return jdbcTemplate.query("SELECT * FROM set WHERE set_name ILIKE ?", MAPPER, "%" + setName + "%");
    }

    @Override
    public List<CardSet> getSetsByYear(String year) {
        return jdbcTemplate.query("SELECT * FROM set WHERE Year ILIKE ?", MAPPER, "%" + year + "%");
    }

    @Override
    public List<CardSet> getSetsByBrand(String brand) {
        return jdbcTemplate.query("SELECT * FROM set WHERE Brand ILIKE ?", MAPPER, "%" + brand + "%");
    }
}
