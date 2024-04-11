package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.UserCard;

import java.util.List;

public interface CardDao {
    List<Card> getCards();

    Card getCardByCardId(int cardID);
    List<Card> getCardsByPlayerId(int playerId);
    List<Card> getCardsByPlayerName(String playerName);
    List<Card> getCardsByTeamId(int teamId);
    List<Card> getCardsByTeamName(String teamName);
    List<Card> getCardsBySetId(int setId);
    List<Card> getCardsBySetName(String setName);
    List<Card> getCardsBySportId(int sportId);
    List<Card> getCardsBySportName(String sportName);
    List<Card> getCardsByUserId(int userId);
    List<Card> getCardsBySubsetId(int subsetId);
    List<Card> getCardsBySubsetIdAndSetId(int subsetId, int setId);
    UserCard addCardToUserCard(int cardId, int userId);
    UserCard deleteCardFromUserCard(int cardId, int userId);

}
