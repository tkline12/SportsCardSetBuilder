package com.techelevator.model;

public class PlayerCard {
    private int playerID;
    private int cardID;

    public PlayerCard(int playerID, int cardID) {
        this.playerID = playerID;
        this.cardID = cardID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }
}
