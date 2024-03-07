package com.techelevator.model;

public class TeamCard {
    private int teamId;
    private int cardId;

    public TeamCard(int teamId, int cardId) {
        this.teamId = teamId;
        this.cardId = cardId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }
}
