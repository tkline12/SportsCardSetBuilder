package com.techelevator.controller;

import com.techelevator.dao.SportDao;
import com.techelevator.model.Sport;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RequestMapping(path = "/sports")
@RestController
public class SportController {
    private SportDao sportDao;

    public SportController(SportDao sportDao) {
        this.sportDao = sportDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Sport> getAllSports(@RequestParam (required = false) String sportName){
        if(sportName == null){
            return sportDao.getSports();
        }
        return sportDao.getSportsByName(sportName);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{id}")
    public Sport getSportById(@PathVariable int id){
        return sportDao.getSportById(id);
    }

}
