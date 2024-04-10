package com.techelevator.model;

public class Subset {
    private int subsetId;

    private String subsetName;

    public Subset(int subsetId, String subsetName) {
        this.subsetId = subsetId;
        this.subsetName = subsetName;
    }

    public int getSubsetId() {
        return subsetId;
    }

    public void setSubsetId(int subset_id) {
        this.subsetId = subset_id;
    }

    public String getSubsetName() {
        return subsetName;
    }

    public void setSubsetName(String subsetName) {
        this.subsetName = subsetName;
    }
}
