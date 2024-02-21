package com.techelevator.model;

public class UserCard {
    private int userID;
    private int cardID;

    public UserCard(int userID, int cardID) {
        this.userID = userID;
        this.cardID = cardID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }
}
