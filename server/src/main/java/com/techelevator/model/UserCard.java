package com.techelevator.model;

public class UserCard {
    private int userId;
    private int cardId;

    public UserCard(int userId, int cardId) {
        this.userId = userId;
        this.cardId = cardId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }
}
