package com.techelevator.model;

import java.util.List;

public class Card {

    private int cardId;
    private String cardName;
    private String cardNumber;
    private List<Player> players;
    private String image;
    private int setId;
    private String setName;
    private boolean owned;


    public Card(int cardId, String cardName, String cardNumber, List<Player> players, String image, int setId, String setName){
        this.cardId = cardId;
        this.cardName = cardName;
        this.cardNumber = cardNumber;
        this.players = players;
        this.image = image;
        this.setId = setId;
        this.setName = setName;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
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

    public int getSetId() {
        return setId;
    }

    public void setSetId(int setId) {
        this.setId = setId;
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
    public String getSetName() {
        return setName;
    }

    public void setSetName(String setName) {
        this.setName = setName;
    }
    public boolean isOwned() {
        return owned;
    }
}
