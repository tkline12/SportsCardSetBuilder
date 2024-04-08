package com.techelevator.model;

public class Subset {
    private int subset_id;
    private String subset_name;

    public Subset(int subset_id, String subset_name) {
        this.subset_id = subset_id;
        this.subset_name = subset_name;
    }

    public int getSubset_id() {
        return subset_id;
    }

    public void setSubset_id(int subset_id) {
        this.subset_id = subset_id;
    }

    public String getSubset_name() {
        return subset_name;
    }

    public void setSubset_name(String subset_name) {
        this.subset_name = subset_name;
    }
}
