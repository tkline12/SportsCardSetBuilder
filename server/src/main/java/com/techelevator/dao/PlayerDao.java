package com.techelevator.dao;

import com.techelevator.model.Player;

import java.util.List;

public interface PlayerDao {
    List<Player> getPlayers();
    Player getPlayerById(int playerId);
    List<Player> getPlayersByPlayerName(String playerName);
    List<Player> getPlayersByTeamId(int teamId);
    List<Player> getPlayersByTeamName(String teamName);
    List<Player> getPlayersByCardId(int cardId);
}
