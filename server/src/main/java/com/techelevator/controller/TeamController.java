package com.techelevator.controller;
import com.techelevator.dao.TeamDao;
import com.techelevator.model.Team;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RequestMapping (path = "/teams")
@RestController
public class TeamController {
    private TeamDao teamDao;

    public TeamController(TeamDao teamDao) {
        this.teamDao = teamDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Team> getAllTeams(@RequestParam(required = false) String teamName){
        if (teamName == null) {
            return teamDao.getTeams();
        }
        return teamDao.getTeamsByName(teamName);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{id}")
    public Team getTeamByID(@PathVariable int id){
        return teamDao.getTeamById(id);
    }

}
