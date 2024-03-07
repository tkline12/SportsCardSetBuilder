package com.techelevator.dao;

import com.techelevator.model.Sport;

import java.util.List;

public interface SportDao {
    List<Sport> getSports();
    Sport getSportById(int sportId);
    List <Sport> getSportsByName(String sportName);
}
