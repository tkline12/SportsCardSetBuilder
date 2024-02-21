package com.techelevator.model;

public class Team {
    private int teamID;
    private String teamName;
    private int sportID;

    public Team(int teamID, String teamName, int sportID) {
        this.teamID = teamID;
        this.teamName = teamName;
        this.sportID = sportID;
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
    public int getSportID() {
        return sportID;
    }

    public void setSportID(int sportID) {
        this.sportID = sportID;
    }
}
