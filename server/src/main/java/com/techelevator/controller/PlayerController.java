package com.techelevator.controller;

import com.techelevator.dao.PlayerDao;
import com.techelevator.model.Player;
import com.techelevator.model.Team;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RequestMapping(path = "/players")
@RestController
public class PlayerController {
    private PlayerDao playerDao;

    public PlayerController(PlayerDao playerDao) {
        this.playerDao = playerDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Player> getAllPlayers(@RequestParam(required = false) String playerName,
                                      @RequestParam(required = false) Integer teamID,
                                      @RequestParam(required = false) String teamName) {
        if (playerName == null && teamID == null && teamName == null) {
            return playerDao.getPlayers();
        }
        if(teamID != null){
            return playerDao.getPlayersByTeamId(teamID);
        }
        if(teamName != null){
            return playerDao.getPlayersByTeamName(teamName);
        }
        return playerDao.getPlayersByPlayerName(playerName);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{playerID}")
    public Player getPlayerByPlayerID(@PathVariable int playerID){
        return playerDao.getPlayerById(playerID);
    }
}
