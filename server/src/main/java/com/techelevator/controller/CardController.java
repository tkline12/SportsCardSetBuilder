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
    public List<Card> getAllCards(@RequestParam (required = false) Integer playerId,
                                  @RequestParam (required = false) String playerName) throws InterruptedException {
        if (playerName == null && playerId == null) {
            return cardDao.getCards();
        }
        if (playerName == null){
            return cardDao.getCardsByPlayerId(playerId);
        }
        return cardDao.getCardsByPlayerName(playerName);

        //need to put on in for getCardsBySetId
    }

    @RequestMapping (method = RequestMethod.GET, path = "/{cardId}")
    public Card getSingleCardById(@PathVariable int cardId){
        return cardDao.getCardByCardId(cardId);
    }


}
