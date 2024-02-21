package com.techelevator.model;

public class Card {

    private int cardID;
    private String cardName;
    private String cardNumber;
    private int setID;
    public Card(int cardID, String cardName, String cardNumber, int setID){
        this.cardID = cardID;
        this.cardName = cardName;
        this.cardNumber = cardNumber;

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

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public int getSetID() {
        return setID;
    }

    public void setSetID(int setID) {
        this.setID = setID;
    }
}
