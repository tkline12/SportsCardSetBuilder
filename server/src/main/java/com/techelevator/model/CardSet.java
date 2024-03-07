package com.techelevator.model;

import java.time.LocalDate;

public class CardSet {
    private int setId;
    private String setName;
    private String year;
    private String brand;
    private String setImage;

    public CardSet(int setId, String setName, String year, String brand, String setImage) {
        this.setId = setId;
        this.setName = setName;
        this.year = year;
        this.brand = brand;
        this.setImage = setImage;
    }

    public int getSetId() {
        return setId;
    }

    public void setSetId(int setId) {
        this.setId = setId;
    }

    public String getSetName() {
        return setName;
    }

    public void setSetName(String setName) {
        this.setName = setName;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getSetImage() {
        return setImage;
    }

    public void setSetImage(String setImage) {
        this.setImage = setImage;
    }
}
