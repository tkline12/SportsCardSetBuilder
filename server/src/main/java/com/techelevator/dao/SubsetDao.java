package com.techelevator.dao;

import com.techelevator.model.Subset;

import java.util.List;

public interface SubsetDao {
    List<Subset> getSubsets();
    Subset getSubsetById(int subsetId);
    List<Subset>getSubsetByName(String subsetName);
}
