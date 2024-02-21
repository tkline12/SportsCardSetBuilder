package com.techelevator.dao;

import com.techelevator.model.CardSet;

import java.util.List;
import java.util.Set;

public interface CardSetDao {
    List<CardSet> getSets();
    CardSet getSetBySetId(int setID);
    List<CardSet> getSetsBySetName(String setName);
    List<CardSet> getSetsByYear(String year);
    List<CardSet> getSetsByBrand(String Brand);
}
