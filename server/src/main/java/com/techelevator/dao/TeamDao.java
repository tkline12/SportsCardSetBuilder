package com.techelevator.dao;

import com.techelevator.model.Team;

import java.util.List;

public interface TeamDao {
    List<Team> getTeams();
    Team getTeamById(int teamId);
    List<Team> getTeamsByName(String teamName);
}
