package com.techelevator.model;

import java.time.LocalDate;

public class CardSet {
    private int setID;
    private String setName;
    private String year;
    private String brand;

    public CardSet(int setID, String setName, String year, String brand) {
        this.setID = setID;
        this.setName = setName;
        this.year = year;
        this.brand = brand;
    }

    public int getSetID() {
        return setID;
    }

    public void setSetID(int setID) {
        this.setID = setID;
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



}
