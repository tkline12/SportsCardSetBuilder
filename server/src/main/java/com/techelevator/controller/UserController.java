package com.techelevator.controller;

import com.techelevator.dao.CardDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Card;
import com.techelevator.model.User;
import com.techelevator.model.UserCard;
import com.techelevator.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

/**
 * The UserController is a class for handling HTTP Requests related to getting User information.
 *
 * It depends on an instance of a UserDAO for retrieving and storing data. This is provided
 * through dependency injection.
 *
 * Note: This class does not handle authentication (registration/login) of Users. That is
 * handled separately in the AuthenticationController.
 */
@RestController
@Validated
@CrossOrigin
//@PreAuthorize("isAuthenticated()")
@RequestMapping( path = "/users")
public class UserController {

    private final UserDao userDao;
    private final UserService userService;
    private final CardDao cardDao;

    public UserController(UserDao userDao, UserService userService, CardDao cardDao) {
        this.userDao = userDao;
        this.userService = userService;
        this.cardDao = cardDao;
    }

    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(method = RequestMethod.GET)
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try {
            users = userDao.getUsers();
        }
        catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }

        return users;
    }

    @RequestMapping(path = "/{userId}", method = RequestMethod.GET)
    public User getById(@PathVariable int userId, Principal principal) {
        User user = null;

        try {
            user = userDao.getUserById(userId);
        }
        catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }

        return user;
    }

    @RequestMapping(path = "", method = RequestMethod.PUT)
    public User updateProfile(@RequestBody User modifiedUser, Principal principal) {
        try {
            return userService.updateUser(modifiedUser, principal.getName());
        }
        catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    @RequestMapping(path = "/{userId}/cards", method = RequestMethod.GET)
    public List<Card> getCardsByUserId(@PathVariable int userId){
        return cardDao.getCardsByUserId(userId);
    }
    @RequestMapping(path = "/{userId}/cards", method = RequestMethod.POST)
    public UserCard addCardToUser(@PathVariable int userId, @RequestBody UserCard userCard){
        return cardDao.addCardToUserCard(userCard.getCardId(), userId);
    }
    @RequestMapping(path = "/{userId}/cards/{cardId}", method = RequestMethod.DELETE)
    public UserCard deleteCardFromUser(@PathVariable int userId, @PathVariable int cardId){
        return cardDao.deleteCardFromUserCard(cardId, userId);
    }
}
