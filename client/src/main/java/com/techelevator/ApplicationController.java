package com.techelevator;

import com.techelevator.model.*;
import com.techelevator.services.AuthenticationService;
import com.techelevator.services.UserService;
import com.techelevator.utils.BasicConsole;
import com.techelevator.utils.BasicLogger;

import java.util.List;

/**
 * AdminController controls the application flow and manages all of its operations through a series of menus.
 * It depends on other classes for:
 *   - interacting with the user - AdminView
 *   - interacting with the server REST API - AuthenticationService, GameService
 */

public class ApplicationController {

    public static final int MAX_GUESSES = 6;


    // Menu options
    private static final String GOTO_ADMIN_MENU = "Go to Admin Menu";
    private static final String LIST_USERS = "List Users";
    private static final String RETURN_TO_MAIN_MENU = "Return to Main Menu";
    private static final String LOG_OUT = "Log Out";
    private static final String EXIT = "Exit the program";
    private static final String[] MAIN_MENU_OPTIONS = {LOG_OUT, EXIT};
    private static final String[] MAIN_MENU_OPTIONS_FOR_ADMIN = {GOTO_ADMIN_MENU, LOG_OUT, EXIT};
    private static final String[] ADMIN_MENU_OPTIONS = {LIST_USERS, RETURN_TO_MAIN_MENU};


    // Service classes for communication to the REST API
    private final AuthenticationService authService;
    private final UserService userService;

    // The view manages all the user interaction, inputs and outputs.
    private final ApplicationView view;

    // The currently logged-in user, or null if no login
    private AuthenticatedUser currentUser;

    /**
     * Constructor - creates instances of the view and service classes. Dependencies are passed in
     * from the main Application class.
     * @param console - a class that implements BasicConsole to pass to the AdminView
     * @param apiBaseUrl - the base url for communication with the server
     */
    public ApplicationController(BasicConsole console, String apiBaseUrl) {
        view = new ApplicationView(console);
        authService = new AuthenticationService(apiBaseUrl);
        userService = new UserService(apiBaseUrl);
    }

    /**
     * The run() method starts the program flow by displaying the main program menu,
     * and responding to the user's selection.
     */
    public void run() {
        try {
            view.displayWelcomeMessage();

            boolean finished = false;
            String menuTitle = "Main Menu";
            String[] menuOptions = MAIN_MENU_OPTIONS;
            // The main menu loop
            while (!finished) {
                if (currentUser == null) {
                    handleLogin();
                    menuOptions = currentUser.getUser().isAdmin() ? MAIN_MENU_OPTIONS_FOR_ADMIN : MAIN_MENU_OPTIONS;
                } else {
                    String mainMenuSelection = view.selectFromMenu(menuTitle, menuOptions);
                    switch (mainMenuSelection) {
                        // ***** Main Menu Options
                        case GOTO_ADMIN_MENU:
                            menuTitle = "Admin Menu";
                            menuOptions = ADMIN_MENU_OPTIONS;
                            break;
                        case LOG_OUT:
                            currentUser = null;
                            break;
                        case EXIT:
                            // Set finished to true so the loop exits.
                            finished = true;
                            break;
                        // ***** Admin Menu Options
                        case LIST_USERS:
                            listUsers();
                            break;
                        case RETURN_TO_MAIN_MENU:
                            menuTitle = "Main Menu";
                            menuOptions = currentUser.getUser().isAdmin() ? MAIN_MENU_OPTIONS_FOR_ADMIN : MAIN_MENU_OPTIONS;
                            break;
                    }
                }
            }
        } catch (Exception e) {
            /*
             * Note: A catch for general Exceptions is used here as a best practice to prevent
             * unexpected Exceptions from halting the application and displaying a stack trace
             * and unfiltered technical error message to the application users.
             */
            view.displayErrorMessage("An unexpected error has occurred. See the log file for details.");
            BasicLogger.log(e);
        }
    }

    /**
     * This application requires both correct credentials (username & password) and the Admin role to
     * successfully log in and use the application.
     */
    private void handleLogin() {
        // Use the view to handle user interactions
        UserCredentials credentials = view.promptForCredentials();

        // Use the service to handle communication with the server
        currentUser = authService.login(credentials);

        // Check for successful login (user is not null) AND admin user role (also known as an authority)
        // Note that the view is also used to give feedback to the user
        if (currentUser == null) {
            view.displayErrorMessage("Login failed.");
        } else {
            view.displaySuccessMessage("Login successful.");
            String token = currentUser.getToken();
            userService.setAuthToken(token);
        }
    }

    private void listUsers() {
        view.displayMessage("==================================================");
        List<User> users = userService.getAllUsers();
        for (User user : users) {
            view.displayMessage(user.toString());
        }
        view.displayMessage("==================================================");
    }
}
