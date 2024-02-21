package com.techelevator.model;

public class Card {

    private int cardID;
    private String cardName;
    private int cardNumber;
    private int userID;
    private int sportID;
    private int playerID;
    private int teamID;
    private int setID;
    public Card(int cardID, String cardName, int cardNumber, int userID, int sportID, int playerID, int teamID, int setID){
        this.cardID = cardID;
        this.cardName = cardName;
        this.cardNumber = cardNumber;
        this.userID = userID;
        this.sportID = sportID;
        this.playerID = playerID;
        this.teamID = teamID;
        this.setID = setID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getSportID() {
        return sportID;
    }

    public void setSportID(int sportID) {
        this.sportID = sportID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public int getSetID() {
        return setID;
    }

    public void setSetID(int setID) {
        this.setID = setID;
    }
}
