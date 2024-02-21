package com.techelevator.services;

import com.techelevator.model.User;
import com.techelevator.utils.BasicLogger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * GameService is a class for managing requests made to the server REST API for games.
 *
 * By encapsulating this logic into a separate class, it becomes easier to manage, maintain, and
 * test the interactions with the server REST API separate from the other application logic.
 **/
public class UserService {

    private final String apiBaseUrl;
    private final RestTemplate restTemplate = new RestTemplate();

    // credential token for the currently logged-in user
    private String authToken = null;

    /**
     * Constructor - The only outside dependency is for the base url used to access the server. Using dependency injection
     * for this value allows it to be more easily changed. It is common for this URL to change for development, testing,
     * and for live deployment.
     *
     * @param url Base URL for the server REST API
     */
    public UserService(String url) {
        this.apiBaseUrl = url;
    }

    /**
     * This method is used by the controller to update the authToken following the user login.
     *
     * @param authToken - credential token for the currently logged-in user.
     */
    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }

    /**
     * Gets all users from the server REST API.
     * @return the list of users, or null if an error occurred
     */
    public List<User> getAllUsers() {
        try {
            ResponseEntity<User[]> response = restTemplate.exchange(apiBaseUrl + "users", HttpMethod.GET,
                    makeAuthEntity(), User[].class);
            return new ArrayList<>(Arrays.asList(response.getBody()));
        } catch (RestClientResponseException | ResourceAccessException e) {
            BasicLogger.log(e.getMessage());
            return null;
        }
    }

    /**
     * Helper method to create the HTTP Entity containing the auth information to send to the server REST API.
     *
     * This is used when the request does not have a body or payload, for example a GET or DELETE.
     *
     * @return HttpEntity containing the auth information (with no request body data).
     */
    private HttpEntity<Void> makeAuthEntity() {
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(authToken);
        return new HttpEntity<>(headers);
    }
}
