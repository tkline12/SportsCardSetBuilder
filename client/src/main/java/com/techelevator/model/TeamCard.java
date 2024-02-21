package com.techelevator.model;

public class TeamCard {
    private int teamID;
    private int cardID;

    public TeamCard(int teamID, int cardID) {
        this.teamID = teamID;
        this.cardID = cardID;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }
}
