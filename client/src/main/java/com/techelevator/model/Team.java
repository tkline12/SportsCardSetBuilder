package com.techelevator.model;

public class Team {
    private int teamID;
    private String teamName;

    public Team(int teamID, String teamName) {
        this.teamID = teamID;
        this.teamName = teamName;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
}
