package com.techelevator.model;

import java.util.List;

public class Card {

    private int cardId;
    private String cardNumber;
    private List<Player> players;
    private String image;
    private int setId;
    private String setName;
    private boolean owned;
    private int subsetId;

    private String subsetName;

    public Card(int cardId, String cardNumber, List<Player> players, String image, int setId, String setName, int subsetId, String subsetName){
        this.cardId = cardId;
        this.cardNumber = cardNumber;
        this.players = players;
        this.image = image;
        this.setId = setId;
        this.setName = setName;
        this.subsetId = subsetId;
        this.subsetName = subsetName;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
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

    public void setOwned(boolean owned) {
        this.owned = owned;
    }

    public int getSubsetId() {
        return subsetId;
    }

    public void setSubsetId(int subsetId) {
        this.subsetId = subsetId;
    }

    public String getSubsetName() {
        return subsetName;
    }

    public void setSubsetName(String subsetName) {
        this.subsetName = subsetName;
    }
}
