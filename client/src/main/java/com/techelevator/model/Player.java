package com.techelevator.model;

public class Player {
    private int playerID;
    private String playerName;
    private int teamID;

    public Player(int playerID, String playerName, int teamID) {
        this.playerID = playerID;
        this.playerName = playerName;
        this.teamID = teamID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }
}
