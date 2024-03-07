package com.techelevator.controller;

import com.techelevator.dao.CardSetDao;
import com.techelevator.model.CardSet;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RequestMapping(path = "/sets")
@RestController
public class CardSetController {
    private CardSetDao cardSetDao;

    public CardSetController(CardSetDao cardSetDao) {
        this.cardSetDao = cardSetDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<CardSet> getAllSets(@RequestParam(required = false) String setName,
                                    @RequestParam(required = false) String brand,
                                    @RequestParam(required = false) String year){
        if (setName == null && brand == null && year == null){
            return cardSetDao.getSets();
        }
        if (brand != null){
            return cardSetDao.getSetsByBrand(brand);
        }
        if (year != null){
            return cardSetDao.getSetsByYear(year);
        }
        return cardSetDao.getSetsBySetName(setName);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{id}")
    public CardSet getSetById(@PathVariable int id){
        return cardSetDao.getSetBySetId(id);
    }
}
