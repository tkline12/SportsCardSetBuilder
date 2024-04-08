package com.techelevator.controller;

import com.techelevator.dao.SubsetDao;

import com.techelevator.model.Subset;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RequestMapping(path = "/subsets")
@RestController
public class SubsetController {
    private SubsetDao subsetDao;

    public SubsetController(SubsetDao subsetDao) {
        this.subsetDao = subsetDao;
    }
    @RequestMapping(method  = RequestMethod.GET)
    public List<Subset> getAllSubsets(@RequestParam (required = false) String subsetName){
        if(subsetName == null){
            return subsetDao.getSubsets();
        }
        return subsetDao.getSubsetByName(subsetName);
    }
    @RequestMapping(method = RequestMethod.GET, path = "/{id}")
    public Subset getSubsetById(@PathVariable int id) {
        return subsetDao.getSubsetById(id);
    }
}
