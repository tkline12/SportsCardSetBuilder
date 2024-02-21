package com.techelevator.model;

import java.util.List;

public class Card {

    private int cardID;
    private String cardName;
    private String cardNumber;
    private List<Player> players;
    private String image;
    private int setID;



    public Card(int cardID, String cardName, String cardNumber, List<Player> players, String image, int setID){
        this.cardID = cardID;
        this.cardName = cardName;
        this.cardNumber = cardNumber;
        this.players = players;
        this.image = image;
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
    public List<Player> getPlayers() {
        return players;
    }

    public void setPlayers(List<Player> players) {
        this.players = players;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
