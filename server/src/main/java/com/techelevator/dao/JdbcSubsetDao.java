package com.techelevator.dao;

import com.techelevator.model.Subset;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Component
public class JdbcSubsetDao implements SubsetDao{
    private final JdbcTemplate jdbcTemplate;
    private static final RowMapper<Subset> MAPPER = new RowMapper<Subset>() {

        @Override
        public Subset mapRow(ResultSet resultSet, int i) throws SQLException {
            int subsetId = resultSet.getInt("subset_id");
            String subsetName = resultSet.getString("subset_name");
            Subset subset = new Subset(subsetId, subsetName);
            return subset;
        }
    };

    public JdbcSubsetDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Subset> getSubsets() {
        return jdbcTemplate.query("SELECT * FROM subset", MAPPER);
    }

    @Override
    public Subset getSubsetById(int subsetId) {
        List<Subset> subset = jdbcTemplate.query("SELECT * FROM subset WHERE subset_id = ?", MAPPER, subsetId);
        return subset.isEmpty() ? null : subset.get(0);
    }

    @Override
    public List<Subset> getSubsetByName(String subsetName) {
        return jdbcTemplate.query("SELECT * FROM subset WHERE subset_name ILIKE ?", MAPPER, "%" + subsetName + "%");
    }
}
