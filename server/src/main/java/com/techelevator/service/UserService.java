package com.techelevator.service;

import com.techelevator.dao.UserDao;
import com.techelevator.model.User;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

@Component
public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public User updateUser(User modifiedUser, String userName) {
        User user;
        User loggedInUser = userDao.getUserByUsername(userName);
        if ((loggedInUser != null) && (loggedInUser.getId() != modifiedUser.getId())) {
            throw new AccessDeniedException("Access denied");
        }
        user = userDao.updateUser(modifiedUser);
        return user;
    }
}
