package com.techelevator;

import com.techelevator.model.UserCredentials;
import com.techelevator.utils.BasicConsole;

/**
 * AdminView is used for gathering information from the user and presenting information to the user.
 *
 * It depends on an object that implements the BasicConsole interface to handle reading from and writing to the console.
 */
public class ApplicationView {

    /*
     * The following constants support printing to the console in color.
     *
     *     Example: https://stackoverflow.com/questions/5762491/how-to-print-color-in-console-using-system-out-println
     *     Here we use (char)27 instead of '\u001B' (hex 1B == dec 27) shown in the example. They are the same character.
     *     Escape codes for colors: https://en.wikipedia.org/wiki/ANSI_escape_code#Escape_sequences
     */

    // TODO: Should be static!
    private final String FOREGROUND_DEFAULT = (char) 27 + "[39m";
    private final String FOREGROUND_RED = (char) 27 + "[31m";
    private final String FOREGROUND_GREEN = (char) 27 + "[32m";
    private final String FOREGROUND_BLUE = (char) 27 + "[34m";

    private final BasicConsole console;

    // Constructor uses dependency injection to get the console object to use for printing.
    public ApplicationView(BasicConsole console) {
        this.console = console;
    }

    /**
     * Adds a blank line to the display.
     */
    public void displayBlankLine() {
        console.printBlankLine();
    }

    /**
     * Adds a message to the display in normal text.
     * @param message the message to show
     */
    public void displayMessage(String message) {
        console.printMessage(message);
    }

    /**
     * Adds an error message to the display in red text.
     * @param message the message to show
     */
    public void displayErrorMessage(String message) {
        console.printErrorMessage(FOREGROUND_RED + message + FOREGROUND_DEFAULT);
        console.printBlankLine();
    }

    /**
     * Adds an error message to the display in green text.
     * @param message the message to show
     */
    public void displaySuccessMessage(String message) {
        console.printMessage(FOREGROUND_GREEN + message + FOREGROUND_DEFAULT);
        console.printBlankLine();
    }

    /**
     * Displays a welcome message with a green banner.
     */
    public void displayWelcomeMessage() {
        String message = "Welcome to MY SIDE PROJECT!";
        console.printBanner(FOREGROUND_GREEN + message + FOREGROUND_DEFAULT);
        console.printBlankLine();
    }

    /**
     * Displays a list of menu options, prompting the user to select one
     * @param menuTitle the title of the menu
     * @param options the list of options to choose from
     * @return
     */
    public String selectFromMenu(String menuTitle, String[] options) {
        console.printBanner(FOREGROUND_BLUE + menuTitle + FOREGROUND_DEFAULT);
        String selection = console.getMenuSelection(options);
        console.printBlankLine();
        return selection;
    }

    /**
     * Prompts for the values required to log-in - username & password
     * @return a UserCredentials object
     */
    public UserCredentials promptForCredentials() {
        console.printMessage("Please login.");
        String username = console.promptForString("Username: ");
        String password = console.promptForString("Password: ");
        return new UserCredentials(username, password);
    }

    public String promptForGuess(int guessNumber) {
        return console.promptForString(String.format("Enter guess number %d: ", guessNumber)).toLowerCase();
    }

    //
    // Helper functions to support getting user input and basic validation of input values
    //
    private String promptForStringUpdateValue(String prompt, boolean required, String currentValue) {
        prompt = promptWithValue(prompt, currentValue);
        while (true) {
            String entry = console.promptForString(prompt);
            if (!entry.isEmpty() || !required) {
                return entry;
            }
            displayErrorMessage("A value is required, please try again.");
        }
    }

    private boolean promptForBooleanUpdateValue(String prompt, boolean currentValue) {
        prompt = promptWithValue(prompt, currentValue ? "yes" : "no");
        return console.promptForYesNo(prompt);
    }

    private String promptWithValue(String prompt, Object displayedValue) {
        if (displayedValue != null) {
            return prompt + "[" + displayedValue.toString() + "]: ";
        }
        return prompt + ": ";
    }
}
