package com.techelevator.dao;

import com.techelevator.model.Team;

import java.util.List;

public interface TeamDao {
    List<Team> getTeams();
    Team getTeamById(int teamID);
    List<Team> getTeamsByName(String teamName);
}
