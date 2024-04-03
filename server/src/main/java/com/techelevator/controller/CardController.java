package com.techelevator.controller;

import com.techelevator.dao.CardDao;
import com.techelevator.model.Card;
import com.techelevator.model.UserCard;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//@PreAuthorize("isAuthenticated()")
@CrossOrigin
@RestController
@RequestMapping (path = "/cards")
public class CardController {
    private CardDao cardDao;

    public CardController(CardDao cardDao) {
        this.cardDao = cardDao;
    }
    @RequestMapping (method = RequestMethod.GET)
    public List<Card> getAllCards() throws InterruptedException {
        return cardDao.getCards();
    }

    @RequestMapping (method = RequestMethod.GET, path = "/{cardId}")
    public Card getSingleCardById(@PathVariable int cardId){
        return cardDao.getCardByCardId(cardId);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/sets/{setId}")
    public List<Card> getCardsBySetId(@PathVariable int setId) {
        return cardDao.getCardsBySetId(setId);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/players/{playerId}")
    public List<Card> getCardsByPlayerId(@PathVariable int playerId) {
        return cardDao.getCardsByPlayerId(playerId);
    }

//    @RequestMapping(method = RequestMethod.PUT)
//    public UserCard changeCardOwnership(@RequestBody UserCard userCard){
//       return cardDao.changeCardOwnership(userCard);
//    }
}
