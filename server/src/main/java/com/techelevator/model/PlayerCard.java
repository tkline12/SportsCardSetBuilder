package com.techelevator.model;

public class PlayerCard {
    private int playerId;
    private int cardId;

    public PlayerCard(int playerId, int cardId) {
        this.playerId = playerId;
        this.cardId = cardId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }
}
