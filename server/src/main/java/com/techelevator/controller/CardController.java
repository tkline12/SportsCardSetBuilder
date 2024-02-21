package com.techelevator.controller;

import com.techelevator.dao.CardDao;
import com.techelevator.model.Card;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping (path = "/cards")
public class CardController {
    private CardDao cardDao;

    public CardController(CardDao cardDao) {
        this.cardDao = cardDao;
    }
    @RequestMapping (method = RequestMethod.GET)
    public List<Card> getAllCards(@RequestParam (required = false) Integer playerID,
                                  @RequestParam (required = false) String playerName) throws InterruptedException {
        Thread.sleep(3000);
        if (playerName == null && playerID == null) {
            return cardDao.getCards();
        }
        if (playerName == null){
            return cardDao.getCardsByPlayerId(playerID);
        }
        return cardDao.getCardsByPlayerName(playerName);
    }

    @RequestMapping (method = RequestMethod.GET, path = "/{cardID}")
    public Card getSingleCardByID(@PathVariable int cardID){
        return cardDao.getCardByCardId(cardID);
    }


}
