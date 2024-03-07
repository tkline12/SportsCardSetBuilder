package com.techelevator.model;

public class Team {
    private int teamId;
    private String teamName;
    private int sportId;

    public Team(int teamId, String teamName, int sportId) {
        this.teamId = teamId;
        this.teamName = teamName;
        this.sportId = sportId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;

    }
    public int getSportId() {
        return sportId;
    }

    public void setSportId(int sportId) {
        this.sportId = sportId;
    }
}
